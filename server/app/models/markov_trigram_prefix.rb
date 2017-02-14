# == Schema Information
#
# Table name: markov_trigram_prefixes
#
#  id           :integer          not null, primary key
#  source_type  :string(255)      not null
#  prefix       :string(255)      default(""), not null
#  state        :integer          default(0), not null
#  unique_count :integer          default(0), not null
#  sum_count    :integer          default(0), not null
#
# Indexes
#
#  markov_trigram_prefixes_indexes  (prefix,state,source_type) UNIQUE
#

class MarkovTrigramPrefix < ApplicationRecord
end
