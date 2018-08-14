require 'rails_helper'

RSpec.describe Api::V1::ReportsController, type: :controller do
  describe 'GET #infected_survivors' do
    let!(:infected_survivors_list) do
      create_list(:survivor, 3, :with_received_infection_alerts, received_count: 5)
    end

    subject! { get :infected_survivors }

    include_examples 'shared examples for api/v1 responses', :success, 'reports/infected_survivors'
  end

  describe 'GET #non_infected_survivors' do
    let!(:non_infected_survivors_list) do
      create_list(:survivor, 3, :with_received_infection_alerts, received_count: 2)
    end

    subject! { get :non_infected_survivors }

    include_examples 'shared examples for api/v1 responses', :success, 'reports/non_infected_survivors'
  end

  describe 'GET #average_amount_of_trade_items' do
    let!(:survivors_list) { create_list(:survivor, 3, :with_items) }

    subject! { get :average_amount_of_trade_items }

    include_examples 'shared examples for api/v1 responses', :success, 'reports/average_amount_of_trade_items'
  end

  describe 'GET #points_lost_due_to_infection' do
    let!(:infected_survivor_with_items) do
      create(
        :survivor,
        :with_received_infection_alerts,
        :with_items,
        received_count: 5
      )
    end

    subject! { get :points_lost_due_to_infection }

    include_examples 'shared examples for api/v1 responses', :success, 'reports/points_lost_due_to_infection'
  end
end
