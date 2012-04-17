#
# Cookbook Name:: newrelic-agent
# Attributes:: default
#
# Copyright 2010, Skystack, Limited
# Copyright 2012, CakeMail (renaming)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

default[:newrelic_agent]['newrelic.appname']                                       = 'PHP Application'
 
default[:newrelic_agent][:php]['newrelic.enabled']                                  = 1
default[:newrelic_agent][:php]['newrelic.transaction_tracer.enable']                = 1
default[:newrelic_agent][:php]['newrelic.transaction_tracer.threshold']             = 'adpex_f'
default[:newrelic_agent][:php]['newrelic.transaction_tracer.top100']                = 0
default[:newrelic_agent][:php]['newrelic.transaction_tracer.record_sql']            = 'obfuscated'
default[:newrelic_agent][:php]['newrelic.transaction_tracer.stack_trace_theshold']  = 500
default[:newrelic_agent][:php]['newrelic.transaction_tracer.custom']                = ''
default[:newrelic_agent][:php]['newrelic.logfile']                                  = ''
default[:newrelic_agent][:php]['newrelic.loglevel']                                 = 'warning'
default[:newrelic_agent][:php]['newrelic.enable_params']                            = 0
default[:newrelic_agent][:php]['newrelic.error_collector.enable']                   = 1
default[:newrelic_agent][:php]['newrelic.error_collector.record_database_errors']   = 0
default[:newrelic_agent][:php]['newrelic.webtransaction.name.function']             = ''
default[:newrelic_agent][:php]['newrelic.webtransaction.name.files']                = ''
default[:newrelic_agent][:php]['newrelic.webtransaction.name.remove_trailing_path'] = 0
default[:newrelic_agent][:php]['newrelic.framework']                                = ''
default[:newrelic_agent][:php]['newrelic.browser_monitoring.auto_instrument']       = 1
default[:newrelic_agent][:php]['newrelic.timeout']                                  = 10
default[:newrelic_agent][:php]['newrelic.nonblocking']                              = 1
default[:newrelic_agent][:php]['newrelic.daemon']                                   = '/tmp/.newrelic.sock'


default[:newrelic_agent][:license_key]             = 'ENTER_YOUR_LICENSE_KEY'
default[:newrelic_agent][:pidfile]                 = '/var/run/newrelic-daemon.pid'
default[:newrelic_agent][:logfile]                 = '/var/log/newrelic/newrelic-daemon.log'
default[:newrelic_agent][:loglevel]                = 'info'

#default[:newrelic_agent][:daemon][:collector_host] = 'collector.newrelic.com'
default[:newrelic_agent][:daemon][:collector_host] = 'staging-collector.newrelic.com'
default[:newrelic_agent][:daemon][:ssl]            = false
default[:newrelic_agent][:daemon][:ssl_ca_bundle]  = ''
default[:newrelic_agent][:daemon][:ssl_ca_path]    = ''
default[:newrelic_agent][:daemon][:timeout]        = 30
default[:newrelic_agent][:daemon][:socket]         = '/tmp/.newrelic.sock'
default[:newrelic_agent][:daemon][:max_threads]    = 8
default[:newrelic_agent][:daemon][:metric_limit]   = 2000
default[:newrelic_agent][:daemon][:special]        = 0
default[:newrelic_agent][:daemon][:proxy]          = ''
