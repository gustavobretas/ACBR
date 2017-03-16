{*****************************************************************}
{                                                                 }
{            CodeGear Delphi Runtime Library                      }
{            NCrypt.pas interface unit                            }
{                                                                 }
{            Coypright (c) 2007,2008 Rudy Velthuis                }
{            Converted 13 Oct 2007 Rudy Velthuis                  }
{            Last modified 07 Mar 2008 Rudy Velthuis              }
{                                                                 }
{            Constant definitions for the NTSTATUS values         }
{                                                                 }
{*****************************************************************}

{*****************************************************************}
{                                                                 }
{ The contents of this file are subject to the Mozilla Public     }
{ License Version 1.1 (the "License"). You may not use this file  }
{ except in compliance with the License. You may obtain a copy of }
{ the License at http://www.mozilla.org/MPL/MPL-1.1.html          }
{                                                                 }
{ Software distributed under the License is distributed on an     }
{ "AS IS" basis, WITHOUT WARRANTY OF ANY KIND, either express or  }
{ implied. See the License for the specific language governing    }
{ rights and limitations under the License.                       }
{                                                                 }
{ The original code is: ntstatus.h, released 1989.                }
{                                                                 }
{ The initial developer of the original translation is            }
{ Rudy Velthuis (articles@rvelthuis.de).                          }
{                                                                 }
{ Portions created by Rudy Velthuis are                           }
{ Copyright (C) 2007,2008 Rudy Velthuis.                          }
{                                                                 }
{ Portions created by Microsoft Corporation are                   }
{ Copyright (C) 1992-1999 Microsoft Corporation.                  }
{                                                                 }
{ All Rights Reserved.                                            }
{                                                                 }
{*****************************************************************}

{$I ACBr.inc}

unit ACBr_NTStatus;

{$WEAKPACKAGEUNIT}
{$ALIGN 8}

interface

uses
  Windows, Types;

{$HPPEMIT '#include <ntstatus.h>'}

type
  TNTStatus = Cardinal;

const
/////////////////////////////////////////////////////////////////////////
//
// Please update FACILITY_MAXIMUM_VALUE when adding new facility values.
//
//
/////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////
//
// Standard Success values
//
//
/////////////////////////////////////////////////////////////////////////

//
// The success status codes 0 - 63 are reserved for wait completion status.
// FacilityCodes 0x5 - 0xF have been allocated by various drivers.
//
  {$EXTERNALSYM STATUS_SUCCESS}
  STATUS_SUCCESS                          = TNTStatus($00000000); // ntsubauth
  {$EXTERNALSYM ERROR_SEVERITY_ERROR}
  ERROR_SEVERITY_ERROR                    = TNTStatus($C0000000);


//
//  Values are 32 bit values laid out as follows:
//
//   3 3 2 2 2 2 2 2 2 2 2 2 1 1 1 1 1 1 1 1 1 1
//   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
//  +---+-+-+-----------------------+-------------------------------+
//  |Sev|C|R|     Facility          |               Code            |
//  +---+-+-+-----------------------+-------------------------------+
//
//  where
//
//      Sev - is the severity code
//
//          00 - Success
//          01 - Informational
//          10 - Warning
//          11 - Error
//
//      C - is the Customer code flag
//
//      R - is a reserved bit
//
//      Facility - is the facility code
//
//      Code - is the facility's status code
//
//
// Define the facility codes
//
  {$EXTERNALSYM FACILITY_VIDEO}
  FACILITY_VIDEO                   = $1B;
  {$EXTERNALSYM FACILITY_USB_ERROR_CODE}
  FACILITY_USB_ERROR_CODE          = $10;
  {$EXTERNALSYM FACILITY_TRANSACTION}
  FACILITY_TRANSACTION             = $19;
  {$EXTERNALSYM FACILITY_TERMINAL_SERVER}
  FACILITY_TERMINAL_SERVER         = $A;
  {$EXTERNALSYM FACILITY_SXS_ERROR_CODE}
  FACILITY_SXS_ERROR_CODE          = $15;
  {$EXTERNALSYM FACILITY_NTSSPI}
  FACILITY_NTSSPI                  = $9;
  {$EXTERNALSYM FACILITY_RPC_STUBS}
  FACILITY_RPC_STUBS               = $3;
  {$EXTERNALSYM FACILITY_RPC_RUNTIME}
  FACILITY_RPC_RUNTIME             = $2;
  {$EXTERNALSYM FACILITY_NTWIN32}
  FACILITY_NTWIN32                 = $7;
  {$EXTERNALSYM FACILITY_NDIS_ERROR_CODE}
  FACILITY_NDIS_ERROR_CODE         = $23;
  {$EXTERNALSYM FACILTIY_MUI_ERROR_CODE}
  FACILTIY_MUI_ERROR_CODE          = $B;
  {$EXTERNALSYM FACILITY_MONITOR}
  FACILITY_MONITOR                 = $1D;
  {$EXTERNALSYM FACILITY_MAXIMUM_VALUE}
  FACILITY_MAXIMUM_VALUE           = $37;
  {$EXTERNALSYM FACILITY_IPSEC}
  FACILITY_IPSEC                   = $36;
  {$EXTERNALSYM FACILITY_IO_ERROR_CODE}
  FACILITY_IO_ERROR_CODE           = $4;
  {$EXTERNALSYM FACILITY_HYPERVISOR}
  FACILITY_HYPERVISOR              = $35;
  {$EXTERNALSYM FACILITY_HID_ERROR_CODE}
  FACILITY_HID_ERROR_CODE          = $11;
  {$EXTERNALSYM FACILITY_GRAPHICS_KERNEL}
  FACILITY_GRAPHICS_KERNEL         = $1E;
  {$EXTERNALSYM FACILITY_FWP_ERROR_CODE}
  FACILITY_FWP_ERROR_CODE          = $22;
  {$EXTERNALSYM FACILITY_FVE_ERROR_CODE}
  FACILITY_FVE_ERROR_CODE          = $21;
  {$EXTERNALSYM FACILITY_FIREWIRE_ERROR_CODE}
  FACILITY_FIREWIRE_ERROR_CODE     = $12;
  {$EXTERNALSYM FACILITY_FILTER_MANAGER}
  FACILITY_FILTER_MANAGER          = $1C;
  {$EXTERNALSYM FACILITY_DRIVER_FRAMEWORK}
  FACILITY_DRIVER_FRAMEWORK        = $20;
  {$EXTERNALSYM FACILITY_DEBUGGER}
  FACILITY_DEBUGGER                = $1;
  {$EXTERNALSYM FACILITY_COMMONLOG}
  FACILITY_COMMONLOG               = $1A;
  {$EXTERNALSYM FACILITY_CLUSTER_ERROR_CODE}
  FACILITY_CLUSTER_ERROR_CODE      = $13;
  {$EXTERNALSYM FACILITY_ACPI_ERROR_CODE}
  FACILITY_ACPI_ERROR_CODE         = $14;


//
// Define the severity codes
//
  {$EXTERNALSYM STATUS_SEVERITY_WARNING}
  STATUS_SEVERITY_WARNING          = $2;
  {$EXTERNALSYM STATUS_SEVERITY_SUCCESS}
  STATUS_SEVERITY_SUCCESS          = $0;
  {$EXTERNALSYM STATUS_SEVERITY_INFORMATIONAL}
  STATUS_SEVERITY_INFORMATIONAL    = $1;
  {$EXTERNALSYM STATUS_SEVERITY_ERROR}
  STATUS_SEVERITY_ERROR            = $3;


//
// MessageId: STATUS_WAIT_0
//
// MessageText:
//
//  STATUS_WAIT_0
//
  {$EXTERNALSYM STATUS_WAIT_0}
  STATUS_WAIT_0                           =  TNTStatus($00000000);    // winnt

//
// MessageId: STATUS_WAIT_1
//
// MessageText:
//
//  STATUS_WAIT_1
//
  {$EXTERNALSYM STATUS_WAIT_1}
  STATUS_WAIT_1                           =  TNTStatus($00000001);

//
// MessageId: STATUS_WAIT_2
//
// MessageText:
//
//  STATUS_WAIT_2
//
  {$EXTERNALSYM STATUS_WAIT_2}
  STATUS_WAIT_2                           =  TNTStatus($00000002);

//
// MessageId: STATUS_WAIT_3
//
// MessageText:
//
//  STATUS_WAIT_3
//
  {$EXTERNALSYM STATUS_WAIT_3}
  STATUS_WAIT_3                           =  TNTStatus($00000003);

//
// MessageId: STATUS_WAIT_63
//
// MessageText:
//
//  STATUS_WAIT_63
//
  {$EXTERNALSYM STATUS_WAIT_63}
  STATUS_WAIT_63                          =  TNTStatus($0000003F);


//
// The success status codes 128 - 191 are reserved for wait completion
// status with an abandoned mutant object.
//
  {$EXTERNALSYM STATUS_ABANDONED}
  STATUS_ABANDONED                        =  TNTStatus($00000080);

//
// MessageId: STATUS_ABANDONED_WAIT_0
//
// MessageText:
//
//  STATUS_ABANDONED_WAIT_0
//
  {$EXTERNALSYM STATUS_ABANDONED_WAIT_0}
  STATUS_ABANDONED_WAIT_0                 =  TNTStatus($00000080);    // winnt

//
// MessageId: STATUS_ABANDONED_WAIT_63
//
// MessageText:
//
//  STATUS_ABANDONED_WAIT_63
//
  {$EXTERNALSYM STATUS_ABANDONED_WAIT_63}
  STATUS_ABANDONED_WAIT_63                =  TNTStatus($000000BF);


//
// The success status codes 256, 257, 258, and 258 are reserved for
// User APC, Kernel APC, Alerted, and Timeout.
//
//
// MessageId: STATUS_USER_APC
//
// MessageText:
//
//  STATUS_USER_APC
//
  {$EXTERNALSYM STATUS_USER_APC}
  STATUS_USER_APC                         =  TNTStatus($000000C0);    // winnt

//
// MessageId: STATUS_KERNEL_APC
//
// MessageText:
//
//  STATUS_KERNEL_APC
//
  {$EXTERNALSYM STATUS_KERNEL_APC}
  STATUS_KERNEL_APC                       =  TNTStatus($00000100);

//
// MessageId: STATUS_ALERTED
//
// MessageText:
//
//  STATUS_ALERTED
//
  {$EXTERNALSYM STATUS_ALERTED}
  STATUS_ALERTED                          =  TNTStatus($00000101);

//
// MessageId: STATUS_TIMEOUT
//
// MessageText:
//
//  STATUS_TIMEOUT
//
  {$EXTERNALSYM STATUS_TIMEOUT}
  STATUS_TIMEOUT                          =  TNTStatus($00000102);    // winnt

//
// MessageId: STATUS_PENDING
//
// MessageText:
//
// The operation that was requested is pending completion.
//
  {$EXTERNALSYM STATUS_PENDING}
  STATUS_PENDING                          =  TNTStatus($00000103);    // winnt

//
// MessageId: STATUS_REPARSE
//
// MessageText:
//
// A reparse should be performed by the Object Manager since the name of the file resulted in a symbolic link.
//
  {$EXTERNALSYM STATUS_REPARSE}
  STATUS_REPARSE                          =  TNTStatus($00000104);

//
// MessageId: STATUS_MORE_ENTRIES
//
// MessageText:
//
// Returned by enumeration APIs to indicate more information is available to successive calls.
//
  {$EXTERNALSYM STATUS_MORE_ENTRIES}
  STATUS_MORE_ENTRIES                     =  TNTStatus($00000105);

//
// MessageId: STATUS_NOT_ALL_ASSIGNED
//
// MessageText:
//
// Indicates not all privileges or groups referenced are assigned to the caller.
// This allows, for example, all privileges to be disabled without having to know exactly which privileges are assigned.
//
  {$EXTERNALSYM STATUS_NOT_ALL_ASSIGNED}
  STATUS_NOT_ALL_ASSIGNED                 =  TNTStatus($00000106);

//
// MessageId: STATUS_SOME_NOT_MAPPED
//
// MessageText:
//
// Some of the information to be translated has not been translated.
//
  {$EXTERNALSYM STATUS_SOME_NOT_MAPPED}
  STATUS_SOME_NOT_MAPPED                  =  TNTStatus($00000107);

//
// MessageId: STATUS_OPLOCK_BREAK_IN_PROGRESS
//
// MessageText:
//
// An open/create operation completed while an oplock break is underway.
//
  {$EXTERNALSYM STATUS_OPLOCK_BREAK_IN_PROGRESS}
  STATUS_OPLOCK_BREAK_IN_PROGRESS         =  TNTStatus($00000108);

//
// MessageId: STATUS_VOLUME_MOUNTED
//
// MessageText:
//
// A new volume has been mounted by a file system.
//
  {$EXTERNALSYM STATUS_VOLUME_MOUNTED}
  STATUS_VOLUME_MOUNTED                   =  TNTStatus($00000109);

//
// MessageId: STATUS_RXACT_COMMITTED
//
// MessageText:
//
// This success level status indicates that the transaction state already exists for the registry sub-tree, but that a transaction commit was previously aborted.
// The commit has now been completed.
//
  {$EXTERNALSYM STATUS_RXACT_COMMITTED}
  STATUS_RXACT_COMMITTED                  =  TNTStatus($0000010A);

//
// MessageId: STATUS_NOTIFY_CLEANUP
//
// MessageText:
//
// This indicates that a notify change request has been completed due to closing the handle which made the notify change request.
//
  {$EXTERNALSYM STATUS_NOTIFY_CLEANUP}
  STATUS_NOTIFY_CLEANUP                   =  TNTStatus($0000010B);

//
// MessageId: STATUS_NOTIFY_ENUM_DIR
//
// MessageText:
//
// This indicates that a notify change request is being completed and that the information is not being returned in the caller's buffer.
// The caller now needs to enumerate the files to find the changes.
//
  {$EXTERNALSYM STATUS_NOTIFY_ENUM_DIR}
  STATUS_NOTIFY_ENUM_DIR                  =  TNTStatus($0000010C);

//
// MessageId: STATUS_NO_QUOTAS_FOR_ACCOUNT
//
// MessageText:
//
// {No Quotas}
// No system quota limits are specifically set for this account.
//
  {$EXTERNALSYM STATUS_NO_QUOTAS_FOR_ACCOUNT}
  STATUS_NO_QUOTAS_FOR_ACCOUNT            =  TNTStatus($0000010D);

//
// MessageId: STATUS_PRIMARY_TRANSPORT_CONNECT_FAILED
//
// MessageText:
//
// {Connect Failure on Primary Transport}
// An attempt was made to connect to the remote server %hs on the primary transport, but the connection failed.
// The computer WAS able to connect on a secondary transport.
//
  {$EXTERNALSYM STATUS_PRIMARY_TRANSPORT_CONNECT_FAILED}
  STATUS_PRIMARY_TRANSPORT_CONNECT_FAILED =  TNTStatus($0000010E);

//
// MessageId: STATUS_PAGE_FAULT_TRANSITION
//
// MessageText:
//
// Page fault was a transition fault.
//
  {$EXTERNALSYM STATUS_PAGE_FAULT_TRANSITION}
  STATUS_PAGE_FAULT_TRANSITION            =  TNTStatus($00000110);

//
// MessageId: STATUS_PAGE_FAULT_DEMAND_ZERO
//
// MessageText:
//
// Page fault was a demand zero fault.
//
  {$EXTERNALSYM STATUS_PAGE_FAULT_DEMAND_ZERO}
  STATUS_PAGE_FAULT_DEMAND_ZERO           =  TNTStatus($00000111);

//
// MessageId: STATUS_PAGE_FAULT_COPY_ON_WRITE
//
// MessageText:
//
// Page fault was a demand zero fault.
//
  {$EXTERNALSYM STATUS_PAGE_FAULT_COPY_ON_WRITE}
  STATUS_PAGE_FAULT_COPY_ON_WRITE         =  TNTStatus($00000112);

//
// MessageId: STATUS_PAGE_FAULT_GUARD_PAGE
//
// MessageText:
//
// Page fault was a demand zero fault.
//
  {$EXTERNALSYM STATUS_PAGE_FAULT_GUARD_PAGE}
  STATUS_PAGE_FAULT_GUARD_PAGE            =  TNTStatus($00000113);

//
// MessageId: STATUS_PAGE_FAULT_PAGING_FILE
//
// MessageText:
//
// Page fault was satisfied by reading from a secondary storage device.
//
  {$EXTERNALSYM STATUS_PAGE_FAULT_PAGING_FILE}
  STATUS_PAGE_FAULT_PAGING_FILE    =  TNTStatus($00000114);

//
// MessageId: STATUS_CACHE_PAGE_LOCKED
//
// MessageText:
//
// Cached page was locked during operation.
//
  {$EXTERNALSYM STATUS_CACHE_PAGE_LOCKED}
  STATUS_CACHE_PAGE_LOCKED         =  TNTStatus($00000115);

//
// MessageId: STATUS_CRASH_DUMP
//
// MessageText:
//
// Crash dump exists in paging file.
//
  {$EXTERNALSYM STATUS_CRASH_DUMP}
  STATUS_CRASH_DUMP                =  TNTStatus($00000116);

//
// MessageId: STATUS_BUFFER_ALL_ZEROS
//
// MessageText:
//
// Specified buffer contains all zeros.
//
  {$EXTERNALSYM STATUS_BUFFER_ALL_ZEROS}
  STATUS_BUFFER_ALL_ZEROS          =  TNTStatus($00000117);

//
// MessageId: STATUS_REPARSE_OBJECT
//
// MessageText:
//
// A reparse should be performed by the Object Manager since the name of the file resulted in a symbolic link.
//
  {$EXTERNALSYM STATUS_REPARSE_OBJECT}
  STATUS_REPARSE_OBJECT            =  TNTStatus($00000118);

//
// MessageId: STATUS_RESOURCE_REQUIREMENTS_CHANGED
//
// MessageText:
//
// The device has succeeded a query-stop and its resource requirements have changed.
//
  {$EXTERNALSYM STATUS_RESOURCE_REQUIREMENTS_CHANGED}
  STATUS_RESOURCE_REQUIREMENTS_CHANGED =  TNTStatus($00000119);

//
// MessageId: STATUS_TRANSLATION_COMPLETE
//
// MessageText:
//
// The translator has translated these resources into the global space and no further translations should be performed.
//
  {$EXTERNALSYM STATUS_TRANSLATION_COMPLETE}
  STATUS_TRANSLATION_COMPLETE      =  TNTStatus($00000120);

//
// MessageId: STATUS_DS_MEMBERSHIP_EVALUATED_LOCALLY
//
// MessageText:
//
// The directory service evaluated group memberships locally, as it was unable to contact a global catalog server.
//
  {$EXTERNALSYM STATUS_DS_MEMBERSHIP_EVALUATED_LOCALLY}
  STATUS_DS_MEMBERSHIP_EVALUATED_LOCALLY =  TNTStatus($00000121);

//
// MessageId: STATUS_NOTHING_TO_TERMINATE
//
// MessageText:
//
// A process being terminated has no threads to terminate.
//
  {$EXTERNALSYM STATUS_NOTHING_TO_TERMINATE}
  STATUS_NOTHING_TO_TERMINATE      =  TNTStatus($00000122);

//
// MessageId: STATUS_PROCESS_NOT_IN_JOB
//
// MessageText:
//
// The specified process is not part of a job.
//
  {$EXTERNALSYM STATUS_PROCESS_NOT_IN_JOB}
  STATUS_PROCESS_NOT_IN_JOB        =  TNTStatus($00000123);

//
// MessageId: STATUS_PROCESS_IN_JOB
//
// MessageText:
//
// The specified process is part of a job.
//
  {$EXTERNALSYM STATUS_PROCESS_IN_JOB}
  STATUS_PROCESS_IN_JOB            =  TNTStatus($00000124);

//
// MessageId: STATUS_VOLSNAP_HIBERNATE_READY
//
// MessageText:
//
// {Volume Shadow Copy Service}
// The system is now ready for hibernation.
//
  {$EXTERNALSYM STATUS_VOLSNAP_HIBERNATE_READY}
  STATUS_VOLSNAP_HIBERNATE_READY   =  TNTStatus($00000125);

//
// MessageId: STATUS_FSFILTER_OP_COMPLETED_SUCCESSFULLY
//
// MessageText:
//
// A file system or file system filter driver has successfully completed an FsFilter operation.
//
  {$EXTERNALSYM STATUS_FSFILTER_OP_COMPLETED_SUCCESSFULLY}
  STATUS_FSFILTER_OP_COMPLETED_SUCCESSFULLY =  TNTStatus($00000126);

//
// MessageId: STATUS_INTERRUPT_VECTOR_ALREADY_CONNECTED
//
// MessageText:
//
// The specified interrupt vector was already connected.
//
  {$EXTERNALSYM STATUS_INTERRUPT_VECTOR_ALREADY_CONNECTED}
  STATUS_INTERRUPT_VECTOR_ALREADY_CONNECTED =  TNTStatus($00000127);

//
// MessageId: STATUS_INTERRUPT_STILL_CONNECTED
//
// MessageText:
//
// The specified interrupt vector is still connected.
//
  {$EXTERNALSYM STATUS_INTERRUPT_STILL_CONNECTED}
  STATUS_INTERRUPT_STILL_CONNECTED =  TNTStatus($00000128);

//
// MessageId: STATUS_PROCESS_CLONED
//
// MessageText:
//
// The current process is a cloned process.
//
  {$EXTERNALSYM STATUS_PROCESS_CLONED}
  STATUS_PROCESS_CLONED            =  TNTStatus($00000129);

//
// MessageId: STATUS_FILE_LOCKED_WITH_ONLY_READERS
//
// MessageText:
//
// The file was locked and all users of the file can only read.
//
  {$EXTERNALSYM STATUS_FILE_LOCKED_WITH_ONLY_READERS}
  STATUS_FILE_LOCKED_WITH_ONLY_READERS =  TNTStatus($0000012A);

//
// MessageId: STATUS_FILE_LOCKED_WITH_WRITERS
//
// MessageText:
//
// The file was locked and at least one user of the file can write.
//
  {$EXTERNALSYM STATUS_FILE_LOCKED_WITH_WRITERS}
  STATUS_FILE_LOCKED_WITH_WRITERS  =  TNTStatus($0000012B);

//
// MessageId: STATUS_RESOURCEMANAGER_READ_ONLY
//
// MessageText:
//
// The specified ResourceManager made no changes or updates to the resource under this transaction.
//
  {$EXTERNALSYM STATUS_RESOURCEMANAGER_READ_ONLY}
  STATUS_RESOURCEMANAGER_READ_ONLY =  TNTStatus($00000202);

//
// MessageId: DBG_EXCEPTION_HANDLED
//
// MessageText:
//
// Debugger handled exception
//
  {$EXTERNALSYM DBG_EXCEPTION_HANDLED}
  DBG_EXCEPTION_HANDLED            =  TNTStatus($00010001);    // winnt

//
// MessageId: DBG_CONTINUE
//
// MessageText:
//
// Debugger continued
//
  {$EXTERNALSYM DBG_CONTINUE}
  DBG_CONTINUE                     =  TNTStatus($00010002);    // winnt

//
// MessageId: STATUS_FLT_IO_COMPLETE
//
// MessageText:
//
// The IO was completed by a filter.
//
  {$EXTERNALSYM STATUS_FLT_IO_COMPLETE}
  STATUS_FLT_IO_COMPLETE           =  TNTStatus($001C0001);



/////////////////////////////////////////////////////////////////////////
//
// Standard Information values
//
/////////////////////////////////////////////////////////////////////////

//
// MessageId: STATUS_OBJECT_NAME_EXISTS
//
// MessageText:
//
// {Object Exists}
// An attempt was made to create an object and the object name already existed.
//
  {$EXTERNALSYM STATUS_OBJECT_NAME_EXISTS}
  STATUS_OBJECT_NAME_EXISTS        =  TNTStatus($40000000);

//
// MessageId: STATUS_THREAD_WAS_SUSPENDED
//
// MessageText:
//
// {Thread Suspended}
// A thread termination occurred while the thread was suspended. The thread was resumed, and termination proceeded.
//
  {$EXTERNALSYM STATUS_THREAD_WAS_SUSPENDED}
  STATUS_THREAD_WAS_SUSPENDED      =  TNTStatus($40000001);

//
// MessageId: STATUS_WORKING_SET_LIMIT_RANGE
//
// MessageText:
//
// {Working Set Range Error}
// An attempt was made to set the working set minimum or maximum to values which are outside of the allowable range.
//
  {$EXTERNALSYM STATUS_WORKING_SET_LIMIT_RANGE}
  STATUS_WORKING_SET_LIMIT_RANGE   =  TNTStatus($40000002);

//
// MessageId: STATUS_IMAGE_NOT_AT_BASE
//
// MessageText:
//
// {Image Relocated}
// An image file could not be mapped at the address specified in the image file. Local fixups must be performed on this image.
//
  {$EXTERNALSYM STATUS_IMAGE_NOT_AT_BASE}
  STATUS_IMAGE_NOT_AT_BASE         =  TNTStatus($40000003);

//
// MessageId: STATUS_RXACT_STATE_CREATED
//
// MessageText:
//
// This informational level status indicates that a specified registry sub-tree transaction state did not yet exist and had to be created.
//
  {$EXTERNALSYM STATUS_RXACT_STATE_CREATED}
  STATUS_RXACT_STATE_CREATED       =  TNTStatus($40000004);

//
// MessageId: STATUS_SEGMENT_NOTIFICATION
//
// MessageText:
//
// {Segment Load}
// A virtual DOS machine (VDM) is loading, unloading, or moving an MS-DOS or Win16 program segment image.
// An exception is raised so a debugger can load, unload or track symbols and breakpoints within these 16-bit segments.
//
  {$EXTERNALSYM STATUS_SEGMENT_NOTIFICATION}
  STATUS_SEGMENT_NOTIFICATION      =  TNTStatus($40000005);    // winnt

//
// MessageId: STATUS_LOCAL_USER_SESSION_KEY
//
// MessageText:
//
// {Local Session Key}
// A user session key was requested for a local RPC connection. The session key returned is a constant value and not unique to this connection.
//
  {$EXTERNALSYM STATUS_LOCAL_USER_SESSION_KEY}
  STATUS_LOCAL_USER_SESSION_KEY    =  TNTStatus($40000006);

//
// MessageId: STATUS_BAD_CURRENT_DIRECTORY
//
// MessageText:
//
// {Invalid Current Directory}
// The process cannot switch to the startup current directory %hs.
// Select OK to set current directory to %hs, or select CANCEL to exit.
//
  {$EXTERNALSYM STATUS_BAD_CURRENT_DIRECTORY}
  STATUS_BAD_CURRENT_DIRECTORY     =  TNTStatus($40000007);

//
// MessageId: STATUS_SERIAL_MORE_WRITES
//
// MessageText:
//
// {Serial IOCTL Complete}
// A serial I/O operation was completed by another write to a serial port.
// (The IOCTL_SERIAL_XOFF_COUNTER reached zero.)
//
  {$EXTERNALSYM STATUS_SERIAL_MORE_WRITES}
  STATUS_SERIAL_MORE_WRITES        =  TNTStatus($40000008);

//
// MessageId: STATUS_REGISTRY_RECOVERED
//
// MessageText:
//
// {Registry Recovery}
// One of the files containing the system's Registry data had to be recovered by use of a log or alternate copy.
// The recovery was successful.
//
  {$EXTERNALSYM STATUS_REGISTRY_RECOVERED}
  STATUS_REGISTRY_RECOVERED        =  TNTStatus($40000009);

//
// MessageId: STATUS_FT_READ_RECOVERY_FROM_BACKUP
//
// MessageText:
//
// {Redundant Read}
// To satisfy a read request, the NT fault-tolerant file system successfully read the requested data from a redundant copy.
// This was done because the file system encountered a failure on a member of the fault-tolerant volume, but was unable to reassign the failing area of the device.
//
  {$EXTERNALSYM STATUS_FT_READ_RECOVERY_FROM_BACKUP}
  STATUS_FT_READ_RECOVERY_FROM_BACKUP =  TNTStatus($4000000A);

//
// MessageId: STATUS_FT_WRITE_RECOVERY
//
// MessageText:
//
// {Redundant Write}
// To satisfy a write request, the NT fault-tolerant file system successfully wrote a redundant copy of the information.
// This was done because the file system encountered a failure on a member of the fault-tolerant volume, but was not able to reassign the failing area of the device.
//
  {$EXTERNALSYM STATUS_FT_WRITE_RECOVERY}
  STATUS_FT_WRITE_RECOVERY         =  TNTStatus($4000000B);

//
// MessageId: STATUS_SERIAL_COUNTER_TIMEOUT
//
// MessageText:
//
// {Serial IOCTL Timeout}
// A serial I/O operation completed because the time-out period expired.
// (The IOCTL_SERIAL_XOFF_COUNTER had not reached zero.)
//
  {$EXTERNALSYM STATUS_SERIAL_COUNTER_TIMEOUT}
  STATUS_SERIAL_COUNTER_TIMEOUT    =  TNTStatus($4000000C);

//
// MessageId: STATUS_NULL_LM_PASSWORD
//
// MessageText:
//
// {Password Too Complex}
// The Windows password is too complex to be converted to a LAN Manager password.
// The LAN Manager password returned is a NULL string.
//
  {$EXTERNALSYM STATUS_NULL_LM_PASSWORD}
  STATUS_NULL_LM_PASSWORD          =  TNTStatus($4000000D);

//
// MessageId: STATUS_IMAGE_MACHINE_TYPE_MISMATCH
//
// MessageText:
//
// {Machine Type Mismatch}
// The image file %hs is valid, but is for a machine type other than the current machine. Select OK to continue, or CANCEL to fail the DLL load.
//
  {$EXTERNALSYM STATUS_IMAGE_MACHINE_TYPE_MISMATCH}
  STATUS_IMAGE_MACHINE_TYPE_MISMATCH =  TNTStatus($4000000E);

//
// MessageId: STATUS_RECEIVE_PARTIAL
//
// MessageText:
//
// {Partial Data Received}
// The network transport returned partial data to its client. The remaining data will be sent later.
//
  {$EXTERNALSYM STATUS_RECEIVE_PARTIAL}
  STATUS_RECEIVE_PARTIAL           =  TNTStatus($4000000F);

//
// MessageId: STATUS_RECEIVE_EXPEDITED
//
// MessageText:
//
// {Expedited Data Received}
// The network transport returned data to its client that was marked as expedited by the remote system.
//
  {$EXTERNALSYM STATUS_RECEIVE_EXPEDITED}
  STATUS_RECEIVE_EXPEDITED         =  TNTStatus($40000010);

//
// MessageId: STATUS_RECEIVE_PARTIAL_EXPEDITED
//
// MessageText:
//
// {Partial Expedited Data Received}
// The network transport returned partial data to its client and this data was marked as expedited by the remote system. The remaining data will be sent later.
//
  {$EXTERNALSYM STATUS_RECEIVE_PARTIAL_EXPEDITED}
  STATUS_RECEIVE_PARTIAL_EXPEDITED =  TNTStatus($40000011);

//
// MessageId: STATUS_EVENT_DONE
//
// MessageText:
//
// {TDI Event Done}
// The TDI indication has completed successfully.
//
  {$EXTERNALSYM STATUS_EVENT_DONE}
  STATUS_EVENT_DONE                =  TNTStatus($40000012);

//
// MessageId: STATUS_EVENT_PENDING
//
// MessageText:
//
// {TDI Event Pending}
// The TDI indication has entered the pending state.
//
  {$EXTERNALSYM STATUS_EVENT_PENDING}
  STATUS_EVENT_PENDING             =  TNTStatus($40000013);

//
// MessageId: STATUS_CHECKING_FILE_SYSTEM
//
// MessageText:
//
// Checking file system on %wZ
//
  {$EXTERNALSYM STATUS_CHECKING_FILE_SYSTEM}
  STATUS_CHECKING_FILE_SYSTEM      =  TNTStatus($40000014);

//
// MessageId: STATUS_FATAL_APP_EXIT
//
// MessageText:
//
// {Fatal Application Exit}
// %hs
//
  {$EXTERNALSYM STATUS_FATAL_APP_EXIT}
  STATUS_FATAL_APP_EXIT            =  TNTStatus($40000015);

//
// MessageId: STATUS_PREDEFINED_HANDLE
//
// MessageText:
//
// The specified registry key is referenced by a predefined handle.
//
  {$EXTERNALSYM STATUS_PREDEFINED_HANDLE}
  STATUS_PREDEFINED_HANDLE         =  TNTStatus($40000016);

//
// MessageId: STATUS_WAS_UNLOCKED
//
// MessageText:
//
// {Page Unlocked}
// The page protection of a locked page was changed to 'No Access' and the page was unlocked from memory and from the process.
//
  {$EXTERNALSYM STATUS_WAS_UNLOCKED}
  STATUS_WAS_UNLOCKED              =  TNTStatus($40000017);

//
// MessageId: STATUS_SERVICE_NOTIFICATION
//
// MessageText:
//
// %hs
//
  {$EXTERNALSYM STATUS_SERVICE_NOTIFICATION}
  STATUS_SERVICE_NOTIFICATION      =  TNTStatus($40000018);

//
// MessageId: STATUS_WAS_LOCKED
//
// MessageText:
//
// {Page Locked}
// One of the pages to lock was already locked.
//
  {$EXTERNALSYM STATUS_WAS_LOCKED}
  STATUS_WAS_LOCKED                =  TNTStatus($40000019);

//
// MessageId: STATUS_LOG_HARD_ERROR
//
// MessageText:
//
// Application popup: %1 : %2
//
  {$EXTERNALSYM STATUS_LOG_HARD_ERROR}
  STATUS_LOG_HARD_ERROR            =  TNTStatus($4000001A);

//
// MessageId: STATUS_ALREADY_WIN32
//
// MessageText:
//
//  STATUS_ALREADY_WIN32
//
  {$EXTERNALSYM STATUS_ALREADY_WIN32}
  STATUS_ALREADY_WIN32             =  TNTStatus($4000001B);

//
// MessageId: STATUS_WX86_UNSIMULATE
//
// MessageText:
//
// Exception status code used by Win32 x86 emulation subsystem.
//
  {$EXTERNALSYM STATUS_WX86_UNSIMULATE}
  STATUS_WX86_UNSIMULATE           =  TNTStatus($4000001C);

//
// MessageId: STATUS_WX86_CONTINUE
//
// MessageText:
//
// Exception status code used by Win32 x86 emulation subsystem.
//
  {$EXTERNALSYM STATUS_WX86_CONTINUE}
  STATUS_WX86_CONTINUE             =  TNTStatus($4000001D);

//
// MessageId: STATUS_WX86_SINGLE_STEP
//
// MessageText:
//
// Exception status code used by Win32 x86 emulation subsystem.
//
  {$EXTERNALSYM STATUS_WX86_SINGLE_STEP}
  STATUS_WX86_SINGLE_STEP          =  TNTStatus($4000001E);

//
// MessageId: STATUS_WX86_BREAKPOINT
//
// MessageText:
//
// Exception status code used by Win32 x86 emulation subsystem.
//
  {$EXTERNALSYM STATUS_WX86_BREAKPOINT}
  STATUS_WX86_BREAKPOINT           =  TNTStatus($4000001F);

//
// MessageId: STATUS_WX86_EXCEPTION_CONTINUE
//
// MessageText:
//
// Exception status code used by Win32 x86 emulation subsystem.
//
  {$EXTERNALSYM STATUS_WX86_EXCEPTION_CONTINUE}
  STATUS_WX86_EXCEPTION_CONTINUE   =  TNTStatus($40000020);

//
// MessageId: STATUS_WX86_EXCEPTION_LASTCHANCE
//
// MessageText:
//
// Exception status code used by Win32 x86 emulation subsystem.
//
  {$EXTERNALSYM STATUS_WX86_EXCEPTION_LASTCHANCE}
  STATUS_WX86_EXCEPTION_LASTCHANCE =  TNTStatus($40000021);

//
// MessageId: STATUS_WX86_EXCEPTION_CHAIN
//
// MessageText:
//
// Exception status code used by Win32 x86 emulation subsystem.
//
  {$EXTERNALSYM STATUS_WX86_EXCEPTION_CHAIN}
  STATUS_WX86_EXCEPTION_CHAIN      =  TNTStatus($40000022);

//
// MessageId: STATUS_IMAGE_MACHINE_TYPE_MISMATCH_EXE
//
// MessageText:
//
// {Machine Type Mismatch}
// The image file %hs is valid, but is for a machine type other than the current machine.
//
  {$EXTERNALSYM STATUS_IMAGE_MACHINE_TYPE_MISMATCH_EXE}
  STATUS_IMAGE_MACHINE_TYPE_MISMATCH_EXE =  TNTStatus($40000023);

//
// MessageId: STATUS_NO_YIELD_PERFORMED
//
// MessageText:
//
// A yield execution was performed and no thread was available to run.
//
  {$EXTERNALSYM STATUS_NO_YIELD_PERFORMED}
  STATUS_NO_YIELD_PERFORMED        =  TNTStatus($40000024);

//
// MessageId: STATUS_TIMER_RESUME_IGNORED
//
// MessageText:
//
// The resumable flag to a timer API was ignored.
//
  {$EXTERNALSYM STATUS_TIMER_RESUME_IGNORED}
  STATUS_TIMER_RESUME_IGNORED      =  TNTStatus($40000025);

//
// MessageId: STATUS_ARBITRATION_UNHANDLED
//
// MessageText:
//
// The arbiter has deferred arbitration of these resources to its parent
//
  {$EXTERNALSYM STATUS_ARBITRATION_UNHANDLED}
  STATUS_ARBITRATION_UNHANDLED     =  TNTStatus($40000026);

//
// MessageId: STATUS_CARDBUS_NOT_SUPPORTED
//
// MessageText:
//
// The device "%hs" has detected a CardBus card in its slot, but the firmware on this system is not configured to allow the CardBus controller to be run in CardBus mode.
// The operating system will currently accept only 16-bit (R2) pc-cards on this controller.
//
  {$EXTERNALSYM STATUS_CARDBUS_NOT_SUPPORTED}
  STATUS_CARDBUS_NOT_SUPPORTED     =  TNTStatus($40000027);

//
// MessageId: STATUS_WX86_CREATEWX86TIB
//
// MessageText:
//
// Exception status code used by Win32 x86 emulation subsystem.
//
  {$EXTERNALSYM STATUS_WX86_CREATEWX86TIB}
  STATUS_WX86_CREATEWX86TIB        =  TNTStatus($40000028);

//
// MessageId: STATUS_MP_PROCESSOR_MISMATCH
//
// MessageText:
//
// The CPUs in this multiprocessor system are not all the same revision level.  To use all processors the operating system restricts itself to the features of the least capable processor in the system.  Should problems occur with this system, contact
// the CPU manufacturer to see if this mix of processors is supported.
//
  {$EXTERNALSYM STATUS_MP_PROCESSOR_MISMATCH}
  STATUS_MP_PROCESSOR_MISMATCH     =  TNTStatus($40000029);

//
// MessageId: STATUS_HIBERNATED
//
// MessageText:
//
// The system was put into hibernation.
//
  {$EXTERNALSYM STATUS_HIBERNATED}
  STATUS_HIBERNATED                =  TNTStatus($4000002A);

//
// MessageId: STATUS_RESUME_HIBERNATION
//
// MessageText:
//
// The system was resumed from hibernation.
//
  {$EXTERNALSYM STATUS_RESUME_HIBERNATION}
  STATUS_RESUME_HIBERNATION        =  TNTStatus($4000002B);

//
// MessageId: STATUS_FIRMWARE_UPDATED
//
// MessageText:
//
// Windows has detected that the system firmware (BIOS) was updated [previous firmware date = %2, current firmware date %3].
//
  {$EXTERNALSYM STATUS_FIRMWARE_UPDATED}
  STATUS_FIRMWARE_UPDATED          =  TNTStatus($4000002C);

//
// MessageId: STATUS_DRIVERS_LEAKING_LOCKED_PAGES
//
// MessageText:
//
// A device driver is leaking locked I/O pages causing system degradation.  The system has automatically enabled tracking code in order to try and catch the culprit.
//
  {$EXTERNALSYM STATUS_DRIVERS_LEAKING_LOCKED_PAGES}
  STATUS_DRIVERS_LEAKING_LOCKED_PAGES =  TNTStatus($4000002D);

//
// MessageId: STATUS_MESSAGE_RETRIEVED
//
// MessageText:
//
// The ALPC message being canceled has already been retrieved from the queue on the other side.
//
  {$EXTERNALSYM STATUS_MESSAGE_RETRIEVED}
  STATUS_MESSAGE_RETRIEVED         =  TNTStatus($4000002E);

//
// MessageId: STATUS_SYSTEM_POWERSTATE_TRANSITION
//
// MessageText:
//
// The system powerstate is transitioning from %2 to %3.
//
  {$EXTERNALSYM STATUS_SYSTEM_POWERSTATE_TRANSITION}
  STATUS_SYSTEM_POWERSTATE_TRANSITION =  TNTStatus($4000002F);

//
// MessageId: STATUS_ALPC_CHECK_COMPLETION_LIST
//
// MessageText:
//
// The receive operation was successful. Check the ALPC completion list for the received message.
//
  {$EXTERNALSYM STATUS_ALPC_CHECK_COMPLETION_LIST}
  STATUS_ALPC_CHECK_COMPLETION_LIST =  TNTStatus($40000030);

//
// MessageId: STATUS_SYSTEM_POWERSTATE_COMPLEX_TRANSITION
//
// MessageText:
//
// The system powerstate is transitioning from %2 to %3 but could enter %4.
//
  {$EXTERNALSYM STATUS_SYSTEM_POWERSTATE_COMPLEX_TRANSITION}
  STATUS_SYSTEM_POWERSTATE_COMPLEX_TRANSITION =  TNTStatus($40000031);

//
// MessageId: STATUS_ACCESS_AUDIT_BY_POLICY
//
// MessageText:
//
// Access to %1 is monitored by policy rule %2.
//
  {$EXTERNALSYM STATUS_ACCESS_AUDIT_BY_POLICY}
  STATUS_ACCESS_AUDIT_BY_POLICY    =  TNTStatus($40000032);

//
// MessageId: STATUS_ABANDON_HIBERFILE
//
// MessageText:
//
// A valid hibernation file has been invalidated and should be abandoned.
//
  {$EXTERNALSYM STATUS_ABANDON_HIBERFILE}
  STATUS_ABANDON_HIBERFILE         =  TNTStatus($40000033);

//
// MessageId: STATUS_BIZRULES_NOT_ENABLED
//
// MessageText:
//
// Business rule scripts are disabled for the calling application.
//
  {$EXTERNALSYM STATUS_BIZRULES_NOT_ENABLED}
  STATUS_BIZRULES_NOT_ENABLED      =  TNTStatus($40000034);

//
// MessageId: DBG_REPLY_LATER
//
// MessageText:
//
// Debugger will reply later.
//
  {$EXTERNALSYM DBG_REPLY_LATER}
  DBG_REPLY_LATER                  =  TNTStatus($40010001);

//
// MessageId: DBG_UNABLE_TO_PROVIDE_HANDLE
//
// MessageText:
//
// Debugger cannot provide handle.
//
  {$EXTERNALSYM DBG_UNABLE_TO_PROVIDE_HANDLE}
  DBG_UNABLE_TO_PROVIDE_HANDLE     =  TNTStatus($40010002);

//
// MessageId: DBG_TERMINATE_THREAD
//
// MessageText:
//
// Debugger terminated thread.
//
  {$EXTERNALSYM DBG_TERMINATE_THREAD}
  DBG_TERMINATE_THREAD             =  TNTStatus($40010003);    // winnt

//
// MessageId: DBG_TERMINATE_PROCESS
//
// MessageText:
//
// Debugger terminated process.
//
  {$EXTERNALSYM DBG_TERMINATE_PROCESS}
  DBG_TERMINATE_PROCESS            =  TNTStatus($40010004);    // winnt

//
// MessageId: DBG_CONTROL_C
//
// MessageText:
//
// Debugger got control C.
//
  {$EXTERNALSYM DBG_CONTROL_C}
  DBG_CONTROL_C                    =  TNTStatus($40010005);    // winnt

//
// MessageId: DBG_PRINTEXCEPTION_C
//
// MessageText:
//
// Debugger printed exception on control C.
//
  {$EXTERNALSYM DBG_PRINTEXCEPTION_C}
  DBG_PRINTEXCEPTION_C             =  TNTStatus($40010006);

//
// MessageId: DBG_RIPEXCEPTION
//
// MessageText:
//
// Debugger received RIP exception.
//
  {$EXTERNALSYM DBG_RIPEXCEPTION}
  DBG_RIPEXCEPTION                 =  TNTStatus($40010007);

//
// MessageId: DBG_CONTROL_BREAK
//
// MessageText:
//
// Debugger received control break.
//
  {$EXTERNALSYM DBG_CONTROL_BREAK}
  DBG_CONTROL_BREAK                =  TNTStatus($40010008);    // winnt

//
// MessageId: DBG_COMMAND_EXCEPTION
//
// MessageText:
//
// Debugger command communication exception.
//
  {$EXTERNALSYM DBG_COMMAND_EXCEPTION}
  DBG_COMMAND_EXCEPTION            =  TNTStatus($40010009);    // winnt

//
// MessageId: STATUS_FLT_BUFFER_TOO_SMALL
//
// MessageText:
//
// {Buffer too small}
// The buffer is too small to contain the entry. No information has been written to the buffer.
//
  {$EXTERNALSYM STATUS_FLT_BUFFER_TOO_SMALL}
  STATUS_FLT_BUFFER_TOO_SMALL      =  TNTStatus($801C0001);



/////////////////////////////////////////////////////////////////////////
//
// Standard Warning values
//
//
// Note:  Do NOT use the value 0x80000000L, as this is a non-portable value
//        for the NT_SUCCESS macro. Warning values start with a code of 1.
//
/////////////////////////////////////////////////////////////////////////

//
// MessageId: STATUS_GUARD_PAGE_VIOLATION
//
// MessageText:
//
// {EXCEPTION}
// Guard Page Exception
// A page of memory that marks the end of a data structure, such as a stack or an array, has been accessed.
//
  {$EXTERNALSYM STATUS_GUARD_PAGE_VIOLATION}
  STATUS_GUARD_PAGE_VIOLATION      =  TNTStatus($80000001);    // winnt

//
// MessageId: STATUS_DATATYPE_MISALIGNMENT
//
// MessageText:
//
// {EXCEPTION}
// Alignment Fault
// A datatype misalignment was detected in a load or store instruction.
//
  {$EXTERNALSYM STATUS_DATATYPE_MISALIGNMENT}
  STATUS_DATATYPE_MISALIGNMENT     =  TNTStatus($80000002);    // winnt

//
// MessageId: STATUS_BREAKPOINT
//
// MessageText:
//
// {EXCEPTION}
// Breakpoint
// A breakpoint has been reached.
//
  {$EXTERNALSYM STATUS_BREAKPOINT}
  STATUS_BREAKPOINT                =  TNTStatus($80000003);    // winnt

//
// MessageId: STATUS_SINGLE_STEP
//
// MessageText:
//
// {EXCEPTION}
// Single Step
// A single step or trace operation has just been completed.
//
  {$EXTERNALSYM STATUS_SINGLE_STEP}
  STATUS_SINGLE_STEP               =  TNTStatus($80000004);    // winnt

//
// MessageId: STATUS_BUFFER_OVERFLOW
//
// MessageText:
//
// {Buffer Overflow}
// The data was too large to fit into the specified buffer.
//
  {$EXTERNALSYM STATUS_BUFFER_OVERFLOW}
  STATUS_BUFFER_OVERFLOW           =  TNTStatus($80000005);

//
// MessageId: STATUS_NO_MORE_FILES
//
// MessageText:
//
// {No More Files}
// No more files were found which match the file specification.
//
  {$EXTERNALSYM STATUS_NO_MORE_FILES}
  STATUS_NO_MORE_FILES             =  TNTStatus($80000006);

//
// MessageId: STATUS_WAKE_SYSTEM_DEBUGGER
//
// MessageText:
//
// {Kernel Debugger Awakened}
// the system debugger was awakened by an interrupt.
//
  {$EXTERNALSYM STATUS_WAKE_SYSTEM_DEBUGGER}
  STATUS_WAKE_SYSTEM_DEBUGGER      =  TNTStatus($80000007);

//
// MessageId: STATUS_HANDLES_CLOSED
//
// MessageText:
//
// {Handles Closed}
// Handles to objects have been automatically closed as a result of the requested operation.
//
  {$EXTERNALSYM STATUS_HANDLES_CLOSED}
  STATUS_HANDLES_CLOSED            =  TNTStatus($8000000A);

//
// MessageId: STATUS_NO_INHERITANCE
//
// MessageText:
//
// {Non-Inheritable ACL}
// An access control list (ACL) contains no components that can be inherited.
//
  {$EXTERNALSYM STATUS_NO_INHERITANCE}
  STATUS_NO_INHERITANCE            =  TNTStatus($8000000B);

//
// MessageId: STATUS_GUID_SUBSTITUTION_MADE
//
// MessageText:
//
// {GUID Substitution}
// During the translation of a global identifier (GUID) to a Windows security ID (SID), no administratively-defined GUID prefix was found.
// A substitute prefix was used, which will not compromise system security.
// However, this may provide a more restrictive access than intended.
//
  {$EXTERNALSYM STATUS_GUID_SUBSTITUTION_MADE}
  STATUS_GUID_SUBSTITUTION_MADE    =  TNTStatus($8000000C);

//
// MessageId: STATUS_PARTIAL_COPY
//
// MessageText:
//
// {Partial Copy}
// Due to protection conflicts not all the requested bytes could be copied.
//
  {$EXTERNALSYM STATUS_PARTIAL_COPY}
  STATUS_PARTIAL_COPY              =  TNTStatus($8000000D);

//
// MessageId: STATUS_DEVICE_PAPER_EMPTY
//
// MessageText:
//
// {Out of Paper}
// The printer is out of paper.
//
  {$EXTERNALSYM STATUS_DEVICE_PAPER_EMPTY}
  STATUS_DEVICE_PAPER_EMPTY        =  TNTStatus($8000000E);

//
// MessageId: STATUS_DEVICE_POWERED_OFF
//
// MessageText:
//
// {Device Power Is Off}
// The printer power has been turned off.
//
  {$EXTERNALSYM STATUS_DEVICE_POWERED_OFF}
  STATUS_DEVICE_POWERED_OFF        =  TNTStatus($8000000F);

//
// MessageId: STATUS_DEVICE_OFF_LINE
//
// MessageText:
//
// {Device Offline}
// The printer has been taken offline.
//
  {$EXTERNALSYM STATUS_DEVICE_OFF_LINE}
  STATUS_DEVICE_OFF_LINE           =  TNTStatus($80000010);

//
// MessageId: STATUS_DEVICE_BUSY
//
// MessageText:
//
// {Device Busy}
// The device is currently busy.
//
  {$EXTERNALSYM STATUS_DEVICE_BUSY}
  STATUS_DEVICE_BUSY               =  TNTStatus($80000011);

//
// MessageId: STATUS_NO_MORE_EAS
//
// MessageText:
//
// {No More EAs}
// No more extended attributes (EAs) were found for the file.
//
  {$EXTERNALSYM STATUS_NO_MORE_EAS}
  STATUS_NO_MORE_EAS               =  TNTStatus($80000012);

//
// MessageId: STATUS_INVALID_EA_NAME
//
// MessageText:
//
// {Illegal EA}
// The specified extended attribute (EA) name contains at least one illegal character.
//
  {$EXTERNALSYM STATUS_INVALID_EA_NAME}
  STATUS_INVALID_EA_NAME           =  TNTStatus($80000013);

//
// MessageId: STATUS_EA_LIST_INCONSISTENT
//
// MessageText:
//
// {Inconsistent EA List}
// The extended attribute (EA) list is inconsistent.
//
  {$EXTERNALSYM STATUS_EA_LIST_INCONSISTENT}
  STATUS_EA_LIST_INCONSISTENT      =  TNTStatus($80000014);

//
// MessageId: STATUS_INVALID_EA_FLAG
//
// MessageText:
//
// {Invalid EA Flag}
// An invalid extended attribute (EA) flag was set.
//
  {$EXTERNALSYM STATUS_INVALID_EA_FLAG}
  STATUS_INVALID_EA_FLAG           =  TNTStatus($80000015);

//
// MessageId: STATUS_VERIFY_REQUIRED
//
// MessageText:
//
// {Verifying Disk}
// The media has changed and a verify operation is in progress so no reads or writes may be performed to the device, except those used in the verify operation.
//
  {$EXTERNALSYM STATUS_VERIFY_REQUIRED}
  STATUS_VERIFY_REQUIRED           =  TNTStatus($80000016);

//
// MessageId: STATUS_EXTRANEOUS_INFORMATION
//
// MessageText:
//
// {Too Much Information}
// The specified access control list (ACL) contained more information than was expected.
//
  {$EXTERNALSYM STATUS_EXTRANEOUS_INFORMATION}
  STATUS_EXTRANEOUS_INFORMATION    =  TNTStatus($80000017);

//
// MessageId: STATUS_RXACT_COMMIT_NECESSARY
//
// MessageText:
//
// This warning level status indicates that the transaction state already exists for the registry sub-tree, but that a transaction commit was previously aborted.
// The commit has NOT been completed, but has not been rolled back either (so it may still be committed if desired).
//
  {$EXTERNALSYM STATUS_RXACT_COMMIT_NECESSARY}
  STATUS_RXACT_COMMIT_NECESSARY    =  TNTStatus($80000018);

//
// MessageId: STATUS_NO_MORE_ENTRIES
//
// MessageText:
//
// {No More Entries}
// No more entries are available from an enumeration operation.
//
  {$EXTERNALSYM STATUS_NO_MORE_ENTRIES}
  STATUS_NO_MORE_ENTRIES           =  TNTStatus($8000001A);

//
// MessageId: STATUS_FILEMARK_DETECTED
//
// MessageText:
//
// {Filemark Found}
// A filemark was detected.
//
  {$EXTERNALSYM STATUS_FILEMARK_DETECTED}
  STATUS_FILEMARK_DETECTED         =  TNTStatus($8000001B);

//
// MessageId: STATUS_MEDIA_CHANGED
//
// MessageText:
//
// {Media Changed}
// The media may have changed.
//
  {$EXTERNALSYM STATUS_MEDIA_CHANGED}
  STATUS_MEDIA_CHANGED             =  TNTStatus($8000001C);

//
// MessageId: STATUS_BUS_RESET
//
// MessageText:
//
// {I/O Bus Reset}
// An I/O bus reset was detected.
//
  {$EXTERNALSYM STATUS_BUS_RESET}
  STATUS_BUS_RESET                 =  TNTStatus($8000001D);

//
// MessageId: STATUS_END_OF_MEDIA
//
// MessageText:
//
// {End of Media}
// The end of the media was encountered.
//
  {$EXTERNALSYM STATUS_END_OF_MEDIA}
  STATUS_END_OF_MEDIA              =  TNTStatus($8000001E);

//
// MessageId: STATUS_BEGINNING_OF_MEDIA
//
// MessageText:
//
// Beginning of tape or partition has been detected.
//
  {$EXTERNALSYM STATUS_BEGINNING_OF_MEDIA}
  STATUS_BEGINNING_OF_MEDIA        =  TNTStatus($8000001F);

//
// MessageId: STATUS_MEDIA_CHECK
//
// MessageText:
//
// {Media Changed}
// The media may have changed.
//
  {$EXTERNALSYM STATUS_MEDIA_CHECK}
  STATUS_MEDIA_CHECK               =  TNTStatus($80000020);

//
// MessageId: STATUS_SETMARK_DETECTED
//
// MessageText:
//
// A tape access reached a setmark.
//
  {$EXTERNALSYM STATUS_SETMARK_DETECTED}
  STATUS_SETMARK_DETECTED          =  TNTStatus($80000021);

//
// MessageId: STATUS_NO_DATA_DETECTED
//
// MessageText:
//
// During a tape access, the end of the data written is reached.
//
  {$EXTERNALSYM STATUS_NO_DATA_DETECTED}
  STATUS_NO_DATA_DETECTED          =  TNTStatus($80000022);

//
// MessageId: STATUS_REDIRECTOR_HAS_OPEN_HANDLES
//
// MessageText:
//
// The redirector is in use and cannot be unloaded.
//
  {$EXTERNALSYM STATUS_REDIRECTOR_HAS_OPEN_HANDLES}
  STATUS_REDIRECTOR_HAS_OPEN_HANDLES =  TNTStatus($80000023);

//
// MessageId: STATUS_SERVER_HAS_OPEN_HANDLES
//
// MessageText:
//
// The server is in use and cannot be unloaded.
//
  {$EXTERNALSYM STATUS_SERVER_HAS_OPEN_HANDLES}
  STATUS_SERVER_HAS_OPEN_HANDLES   =  TNTStatus($80000024);

//
// MessageId: STATUS_ALREADY_DISCONNECTED
//
// MessageText:
//
// The specified connection has already been disconnected.
//
  {$EXTERNALSYM STATUS_ALREADY_DISCONNECTED}
  STATUS_ALREADY_DISCONNECTED      =  TNTStatus($80000025);

//
// MessageId: STATUS_LONGJUMP
//
// MessageText:
//
// A long jump has been executed.
//
  {$EXTERNALSYM STATUS_LONGJUMP}
  STATUS_LONGJUMP                  =  TNTStatus($80000026);

//
// MessageId: STATUS_CLEANER_CARTRIDGE_INSTALLED
//
// MessageText:
//
// A cleaner cartridge is present in the tape library.
//
  {$EXTERNALSYM STATUS_CLEANER_CARTRIDGE_INSTALLED}
  STATUS_CLEANER_CARTRIDGE_INSTALLED =  TNTStatus($80000027);

//
// MessageId: STATUS_PLUGPLAY_QUERY_VETOED
//
// MessageText:
//
// The Plug and Play query operation was not successful.
//
  {$EXTERNALSYM STATUS_PLUGPLAY_QUERY_VETOED}
  STATUS_PLUGPLAY_QUERY_VETOED     =  TNTStatus($80000028);

//
// MessageId: STATUS_UNWIND_CONSOLIDATE
//
// MessageText:
//
// A frame consolidation has been executed.
//
  {$EXTERNALSYM STATUS_UNWIND_CONSOLIDATE}
  STATUS_UNWIND_CONSOLIDATE        =  TNTStatus($80000029);

//
// MessageId: STATUS_REGISTRY_HIVE_RECOVERED
//
// MessageText:
//
// {Registry Hive Recovered}
// Registry hive (file):
// %hs
// was corrupted and it has been recovered. Some data might have been lost.
//
  {$EXTERNALSYM STATUS_REGISTRY_HIVE_RECOVERED}
  STATUS_REGISTRY_HIVE_RECOVERED   =  TNTStatus($8000002A);

//
// MessageId: STATUS_DLL_MIGHT_BE_INSECURE
//
// MessageText:
//
// The application is attempting to run executable code from the module %hs.  This may be insecure.  An alternative, %hs, is available.  Should the application use the secure module %hs?
//
  {$EXTERNALSYM STATUS_DLL_MIGHT_BE_INSECURE}
  STATUS_DLL_MIGHT_BE_INSECURE     =  TNTStatus($8000002B);

//
// MessageId: STATUS_DLL_MIGHT_BE_INCOMPATIBLE
//
// MessageText:
//
// The application is loading executable code from the module %hs.  This is secure, but may be incompatible with previous releases of the operating system.  An alternative, %hs, is available.  Should the application use the secure module %hs?
//
  {$EXTERNALSYM STATUS_DLL_MIGHT_BE_INCOMPATIBLE}
  STATUS_DLL_MIGHT_BE_INCOMPATIBLE =  TNTStatus($8000002C);

//
// MessageId: STATUS_STOPPED_ON_SYMLINK
//
// MessageText:
//
// The create operation stopped after reaching a symbolic link.
//
  {$EXTERNALSYM STATUS_STOPPED_ON_SYMLINK}
  STATUS_STOPPED_ON_SYMLINK        =  TNTStatus($8000002D);

//
// MessageId: DBG_EXCEPTION_NOT_HANDLED
//
// MessageText:
//
// Debugger did not handle the exception.
//
  {$EXTERNALSYM DBG_EXCEPTION_NOT_HANDLED}
  DBG_EXCEPTION_NOT_HANDLED        =  TNTStatus($80010001);    // winnt

//
// MessageId: STATUS_CLUSTER_NODE_ALREADY_UP
//
// MessageText:
//
// The cluster node is already up.
//
  {$EXTERNALSYM STATUS_CLUSTER_NODE_ALREADY_UP}
  STATUS_CLUSTER_NODE_ALREADY_UP   =  TNTStatus($80130001);

//
// MessageId: STATUS_CLUSTER_NODE_ALREADY_DOWN
//
// MessageText:
//
// The cluster node is already down.
//
  {$EXTERNALSYM STATUS_CLUSTER_NODE_ALREADY_DOWN}
  STATUS_CLUSTER_NODE_ALREADY_DOWN =  TNTStatus($80130002);

//
// MessageId: STATUS_CLUSTER_NETWORK_ALREADY_ONLINE
//
// MessageText:
//
// The cluster network is already online.
//
  {$EXTERNALSYM STATUS_CLUSTER_NETWORK_ALREADY_ONLINE}
  STATUS_CLUSTER_NETWORK_ALREADY_ONLINE =  TNTStatus($80130003);

//
// MessageId: STATUS_CLUSTER_NETWORK_ALREADY_OFFLINE
//
// MessageText:
//
// The cluster network is already offline.
//
  {$EXTERNALSYM STATUS_CLUSTER_NETWORK_ALREADY_OFFLINE}
  STATUS_CLUSTER_NETWORK_ALREADY_OFFLINE =  TNTStatus($80130004);

//
// MessageId: STATUS_CLUSTER_NODE_ALREADY_MEMBER
//
// MessageText:
//
// The cluster node is already a member of the cluster.
//
  {$EXTERNALSYM STATUS_CLUSTER_NODE_ALREADY_MEMBER}
  STATUS_CLUSTER_NODE_ALREADY_MEMBER =  TNTStatus($80130005);

//
// MessageId: STATUS_FVE_PARTIAL_METADATA
//
// MessageText:
//
// Volume Metadata read or write is incomplete.
//
  {$EXTERNALSYM STATUS_FVE_PARTIAL_METADATA}
  STATUS_FVE_PARTIAL_METADATA      =  TNTStatus($80210001);



/////////////////////////////////////////////////////////////////////////
//
//  Standard Error values
//
/////////////////////////////////////////////////////////////////////////

//
// MessageId: STATUS_UNSUCCESSFUL
//
// MessageText:
//
// {Operation Failed}
// The requested operation was unsuccessful.
//
  {$EXTERNALSYM STATUS_UNSUCCESSFUL}
  STATUS_UNSUCCESSFUL              =  TNTStatus($C0000001);

//
// MessageId: STATUS_NOT_IMPLEMENTED
//
// MessageText:
//
// {Not Implemented}
// The requested operation is not implemented.
//
  {$EXTERNALSYM STATUS_NOT_IMPLEMENTED}
  STATUS_NOT_IMPLEMENTED           =  TNTStatus($C0000002);

//
// MessageId: STATUS_INVALID_INFO_CLASS
//
// MessageText:
//
// {Invalid Parameter}
// The specified information class is not a valid information class for the specified object.
//
  {$EXTERNALSYM STATUS_INVALID_INFO_CLASS}
  STATUS_INVALID_INFO_CLASS        =  TNTStatus($C0000003);    // ntsubauth

//
// MessageId: STATUS_INFO_LENGTH_MISMATCH
//
// MessageText:
//
// The specified information record length does not match the length required for the specified information class.
//
  {$EXTERNALSYM STATUS_INFO_LENGTH_MISMATCH}
  STATUS_INFO_LENGTH_MISMATCH      =  TNTStatus($C0000004);

//
// MessageId: STATUS_ACCESS_VIOLATION
//
// MessageText:
//
// The instruction at 0x%08lx referenced memory at 0x%08lx. The memory could not be %s.
//
  {$EXTERNALSYM STATUS_ACCESS_VIOLATION}
  STATUS_ACCESS_VIOLATION          =  TNTStatus($C0000005);    // winnt

//
// MessageId: STATUS_IN_PAGE_ERROR
//
// MessageText:
//
// The instruction at 0x%08lx referenced memory at 0x%08lx. The required data was not placed into memory because of an I/O error status of 0x%08lx.
//
  {$EXTERNALSYM STATUS_IN_PAGE_ERROR}
  STATUS_IN_PAGE_ERROR             =  TNTStatus($C0000006);    // winnt

//
// MessageId: STATUS_PAGEFILE_QUOTA
//
// MessageText:
//
// The pagefile quota for the process has been exhausted.
//
  {$EXTERNALSYM STATUS_PAGEFILE_QUOTA}
  STATUS_PAGEFILE_QUOTA            =  TNTStatus($C0000007);

//
// MessageId: STATUS_INVALID_HANDLE
//
// MessageText:
//
// An invalid HANDLE was specified.
//
  {$EXTERNALSYM STATUS_INVALID_HANDLE}
  STATUS_INVALID_HANDLE            =  TNTStatus($C0000008);    // winnt

//
// MessageId: STATUS_BAD_INITIAL_STACK
//
// MessageText:
//
// An invalid initial stack was specified in a call to NtCreateThread.
//
  {$EXTERNALSYM STATUS_BAD_INITIAL_STACK}
  STATUS_BAD_INITIAL_STACK         =  TNTStatus($C0000009);

//
// MessageId: STATUS_BAD_INITIAL_PC
//
// MessageText:
//
// An invalid initial start address was specified in a call to NtCreateThread.
//
  {$EXTERNALSYM STATUS_BAD_INITIAL_PC}
  STATUS_BAD_INITIAL_PC            =  TNTStatus($C000000A);

//
// MessageId: STATUS_INVALID_CID
//
// MessageText:
//
// An invalid Client ID was specified.
//
  {$EXTERNALSYM STATUS_INVALID_CID}
  STATUS_INVALID_CID               =  TNTStatus($C000000B);

//
// MessageId: STATUS_TIMER_NOT_CANCELED
//
// MessageText:
//
// An attempt was made to cancel or set a timer that has an associated APC and the subject thread is not the thread that originally set the timer with an associated APC routine.
//
  {$EXTERNALSYM STATUS_TIMER_NOT_CANCELED}
  STATUS_TIMER_NOT_CANCELED        =  TNTStatus($C000000C);

//
// MessageId: STATUS_INVALID_PARAMETER
//
// MessageText:
//
// An invalid parameter was passed to a service or function.
//
  {$EXTERNALSYM STATUS_INVALID_PARAMETER}
  STATUS_INVALID_PARAMETER         =  TNTStatus($C000000D);

//
// MessageId: STATUS_NO_SUCH_DEVICE
//
// MessageText:
//
// A device which does not exist was specified.
//
  {$EXTERNALSYM STATUS_NO_SUCH_DEVICE}
  STATUS_NO_SUCH_DEVICE            =  TNTStatus($C000000E);

//
// MessageId: STATUS_NO_SUCH_FILE
//
// MessageText:
//
// {File Not Found}
// The file %hs does not exist.
//
  {$EXTERNALSYM STATUS_NO_SUCH_FILE}
  STATUS_NO_SUCH_FILE              =  TNTStatus($C000000F);

//
// MessageId: STATUS_INVALID_DEVICE_REQUEST
//
// MessageText:
//
// The specified request is not a valid operation for the target device.
//
  {$EXTERNALSYM STATUS_INVALID_DEVICE_REQUEST}
  STATUS_INVALID_DEVICE_REQUEST    =  TNTStatus($C0000010);

//
// MessageId: STATUS_END_OF_FILE
//
// MessageText:
//
// The end-of-file marker has been reached. There is no valid data in the file beyond this marker.
//
  {$EXTERNALSYM STATUS_END_OF_FILE}
  STATUS_END_OF_FILE               =  TNTStatus($C0000011);

//
// MessageId: STATUS_WRONG_VOLUME
//
// MessageText:
//
// {Wrong Volume}
// The wrong volume is in the drive.
// Please insert volume %hs into drive %hs.
//
  {$EXTERNALSYM STATUS_WRONG_VOLUME}
  STATUS_WRONG_VOLUME              =  TNTStatus($C0000012);

//
// MessageId: STATUS_NO_MEDIA_IN_DEVICE
//
// MessageText:
//
// {No Disk}
// There is no disk in the drive.
// Please insert a disk into drive %hs.
//
  {$EXTERNALSYM STATUS_NO_MEDIA_IN_DEVICE}
  STATUS_NO_MEDIA_IN_DEVICE        =  TNTStatus($C0000013);

//
// MessageId: STATUS_UNRECOGNIZED_MEDIA
//
// MessageText:
//
// {Unknown Disk Format}
// The disk in drive %hs is not formatted properly.
// Please check the disk, and reformat if necessary.
//
  {$EXTERNALSYM STATUS_UNRECOGNIZED_MEDIA}
  STATUS_UNRECOGNIZED_MEDIA        =  TNTStatus($C0000014);

//
// MessageId: STATUS_NONEXISTENT_SECTOR
//
// MessageText:
//
// {Sector Not Found}
// The specified sector does not exist.
//
  {$EXTERNALSYM STATUS_NONEXISTENT_SECTOR}
  STATUS_NONEXISTENT_SECTOR        =  TNTStatus($C0000015);

//
// MessageId: STATUS_MORE_PROCESSING_REQUIRED
//
// MessageText:
//
// {Still Busy}
// The specified I/O request packet (IRP) cannot be disposed of because the I/O operation is not complete.
//
  {$EXTERNALSYM STATUS_MORE_PROCESSING_REQUIRED}
  STATUS_MORE_PROCESSING_REQUIRED  =  TNTStatus($C0000016);

//
// MessageId: STATUS_NO_MEMORY
//
// MessageText:
//
// {Not Enough Quota}
// Not enough virtual memory or paging file quota is available to complete the specified operation.
//
  {$EXTERNALSYM STATUS_NO_MEMORY}
  STATUS_NO_MEMORY                 =  TNTStatus($C0000017);    // winnt

//
// MessageId: STATUS_CONFLICTING_ADDRESSES
//
// MessageText:
//
// {Conflicting Address Range}
// The specified address range conflicts with the address space.
//
  {$EXTERNALSYM STATUS_CONFLICTING_ADDRESSES}
  STATUS_CONFLICTING_ADDRESSES     =  TNTStatus($C0000018);

//
// MessageId: STATUS_NOT_MAPPED_VIEW
//
// MessageText:
//
// Address range to unmap is not a mapped view.
//
  {$EXTERNALSYM STATUS_NOT_MAPPED_VIEW}
  STATUS_NOT_MAPPED_VIEW           =  TNTStatus($C0000019);

//
// MessageId: STATUS_UNABLE_TO_FREE_VM
//
// MessageText:
//
// Virtual memory cannot be freed.
//
  {$EXTERNALSYM STATUS_UNABLE_TO_FREE_VM}
  STATUS_UNABLE_TO_FREE_VM         =  TNTStatus($C000001A);

//
// MessageId: STATUS_UNABLE_TO_DELETE_SECTION
//
// MessageText:
//
// Specified section cannot be deleted.
//
  {$EXTERNALSYM STATUS_UNABLE_TO_DELETE_SECTION}
  STATUS_UNABLE_TO_DELETE_SECTION  =  TNTStatus($C000001B);

//
// MessageId: STATUS_INVALID_SYSTEM_SERVICE
//
// MessageText:
//
// An invalid system service was specified in a system service call.
//
  {$EXTERNALSYM STATUS_INVALID_SYSTEM_SERVICE}
  STATUS_INVALID_SYSTEM_SERVICE    =  TNTStatus($C000001C);

//
// MessageId: STATUS_ILLEGAL_INSTRUCTION
//
// MessageText:
//
// {EXCEPTION}
// Illegal Instruction
// An attempt was made to execute an illegal instruction.
//
  {$EXTERNALSYM STATUS_ILLEGAL_INSTRUCTION}
  STATUS_ILLEGAL_INSTRUCTION       =  TNTStatus($C000001D);    // winnt

//
// MessageId: STATUS_INVALID_LOCK_SEQUENCE
//
// MessageText:
//
// {Invalid Lock Sequence}
// An attempt was made to execute an invalid lock sequence.
//
  {$EXTERNALSYM STATUS_INVALID_LOCK_SEQUENCE}
  STATUS_INVALID_LOCK_SEQUENCE     =  TNTStatus($C000001E);

//
// MessageId: STATUS_INVALID_VIEW_SIZE
//
// MessageText:
//
// {Invalid Mapping}
// An attempt was made to create a view for a section which is bigger than the section.
//
  {$EXTERNALSYM STATUS_INVALID_VIEW_SIZE}
  STATUS_INVALID_VIEW_SIZE         =  TNTStatus($C000001F);

//
// MessageId: STATUS_INVALID_FILE_FOR_SECTION
//
// MessageText:
//
// {Bad File}
// The attributes of the specified mapping file for a section of memory cannot be read.
//
  {$EXTERNALSYM STATUS_INVALID_FILE_FOR_SECTION}
  STATUS_INVALID_FILE_FOR_SECTION  =  TNTStatus($C0000020);

//
// MessageId: STATUS_ALREADY_COMMITTED
//
// MessageText:
//
// {Already Committed}
// The specified address range is already committed.
//
  {$EXTERNALSYM STATUS_ALREADY_COMMITTED}
  STATUS_ALREADY_COMMITTED         =  TNTStatus($C0000021);

//
// MessageId: STATUS_ACCESS_DENIED
//
// MessageText:
//
// {Access Denied}
// A process has requested access to an object, but has not been granted those access rights.
//
  {$EXTERNALSYM STATUS_ACCESS_DENIED}
  STATUS_ACCESS_DENIED             =  TNTStatus($C0000022);

//
// MessageId: STATUS_BUFFER_TOO_SMALL
//
// MessageText:
//
// {Buffer Too Small}
// The buffer is too small to contain the entry. No information has been written to the buffer.
//
  {$EXTERNALSYM STATUS_BUFFER_TOO_SMALL}
  STATUS_BUFFER_TOO_SMALL          =  TNTStatus($C0000023);

//
// MessageId: STATUS_OBJECT_TYPE_MISMATCH
//
// MessageText:
//
// {Wrong Type}
// There is a mismatch between the type of object required by the requested operation and the type of object that is specified in the request.
//
  {$EXTERNALSYM STATUS_OBJECT_TYPE_MISMATCH}
  STATUS_OBJECT_TYPE_MISMATCH      =  TNTStatus($C0000024);

//
// MessageId: STATUS_NONCONTINUABLE_EXCEPTION
//
// MessageText:
//
// {EXCEPTION}
// Cannot Continue
// Windows cannot continue from this exception.
//
  {$EXTERNALSYM STATUS_NONCONTINUABLE_EXCEPTION}
  STATUS_NONCONTINUABLE_EXCEPTION  =  TNTStatus($C0000025);    // winnt

//
// MessageId: STATUS_INVALID_DISPOSITION
//
// MessageText:
//
// An invalid exception disposition was returned by an exception handler.
//
  {$EXTERNALSYM STATUS_INVALID_DISPOSITION}
  STATUS_INVALID_DISPOSITION       =  TNTStatus($C0000026);    // winnt

//
// MessageId: STATUS_UNWIND
//
// MessageText:
//
// Unwind exception code.
//
  {$EXTERNALSYM STATUS_UNWIND}
  STATUS_UNWIND                    =  TNTStatus($C0000027);

//
// MessageId: STATUS_BAD_STACK
//
// MessageText:
//
// An invalid or unaligned stack was encountered during an unwind operation.
//
  {$EXTERNALSYM STATUS_BAD_STACK}
  STATUS_BAD_STACK                 =  TNTStatus($C0000028);

//
// MessageId: STATUS_INVALID_UNWIND_TARGET
//
// MessageText:
//
// An invalid unwind target was encountered during an unwind operation.
//
  {$EXTERNALSYM STATUS_INVALID_UNWIND_TARGET}
  STATUS_INVALID_UNWIND_TARGET     =  TNTStatus($C0000029);

//
// MessageId: STATUS_NOT_LOCKED
//
// MessageText:
//
// An attempt was made to unlock a page of memory which was not locked.
//
  {$EXTERNALSYM STATUS_NOT_LOCKED}
  STATUS_NOT_LOCKED                =  TNTStatus($C000002A);

//
// MessageId: STATUS_PARITY_ERROR
//
// MessageText:
//
// Device parity error on I/O operation.
//
  {$EXTERNALSYM STATUS_PARITY_ERROR}
  STATUS_PARITY_ERROR              =  TNTStatus($C000002B);

//
// MessageId: STATUS_UNABLE_TO_DECOMMIT_VM
//
// MessageText:
//
// An attempt was made to decommit uncommitted virtual memory.
//
  {$EXTERNALSYM STATUS_UNABLE_TO_DECOMMIT_VM}
  STATUS_UNABLE_TO_DECOMMIT_VM     =  TNTStatus($C000002C);

//
// MessageId: STATUS_NOT_COMMITTED
//
// MessageText:
//
// An attempt was made to change the attributes on memory that has not been committed.
//
  {$EXTERNALSYM STATUS_NOT_COMMITTED}
  STATUS_NOT_COMMITTED             =  TNTStatus($C000002D);

//
// MessageId: STATUS_INVALID_PORT_ATTRIBUTES
//
// MessageText:
//
// Invalid Object Attributes specified to NtCreatePort or invalid Port Attributes specified to NtConnectPort
//
  {$EXTERNALSYM STATUS_INVALID_PORT_ATTRIBUTES}
  STATUS_INVALID_PORT_ATTRIBUTES   =  TNTStatus($C000002E);

//
// MessageId: STATUS_PORT_MESSAGE_TOO_LONG
//
// MessageText:
//
// Length of message passed to NtRequestPort or NtRequestWaitReplyPort was longer than the maximum message allowed by the port.
//
  {$EXTERNALSYM STATUS_PORT_MESSAGE_TOO_LONG}
  STATUS_PORT_MESSAGE_TOO_LONG     =  TNTStatus($C000002F);

//
// MessageId: STATUS_INVALID_PARAMETER_MIX
//
// MessageText:
//
// An invalid combination of parameters was specified.
//
  {$EXTERNALSYM STATUS_INVALID_PARAMETER_MIX}
  STATUS_INVALID_PARAMETER_MIX     =  TNTStatus($C0000030);

//
// MessageId: STATUS_INVALID_QUOTA_LOWER
//
// MessageText:
//
// An attempt was made to lower a quota limit below the current usage.
//
  {$EXTERNALSYM STATUS_INVALID_QUOTA_LOWER}
  STATUS_INVALID_QUOTA_LOWER       =  TNTStatus($C0000031);

//
// MessageId: STATUS_DISK_CORRUPT_ERROR
//
// MessageText:
//
// {Corrupt Disk}
// The file system structure on the disk is corrupt and unusable.
// Please run the Chkdsk utility on the volume %hs.
//
  {$EXTERNALSYM STATUS_DISK_CORRUPT_ERROR}
  STATUS_DISK_CORRUPT_ERROR        =  TNTStatus($C0000032);

//
// MessageId: STATUS_OBJECT_NAME_INVALID
//
// MessageText:
//
// Object Name invalid.
//
  {$EXTERNALSYM STATUS_OBJECT_NAME_INVALID}
  STATUS_OBJECT_NAME_INVALID       =  TNTStatus($C0000033);

//
// MessageId: STATUS_OBJECT_NAME_NOT_FOUND
//
// MessageText:
//
// Object Name not found.
//
  {$EXTERNALSYM STATUS_OBJECT_NAME_NOT_FOUND}
  STATUS_OBJECT_NAME_NOT_FOUND     =  TNTStatus($C0000034);

//
// MessageId: STATUS_OBJECT_NAME_COLLISION
//
// MessageText:
//
// Object Name already exists.
//
  {$EXTERNALSYM STATUS_OBJECT_NAME_COLLISION}
  STATUS_OBJECT_NAME_COLLISION     =  TNTStatus($C0000035);

//
// MessageId: STATUS_PORT_DISCONNECTED
//
// MessageText:
//
// Attempt to send a message to a disconnected communication port.
//
  {$EXTERNALSYM STATUS_PORT_DISCONNECTED}
  STATUS_PORT_DISCONNECTED         =  TNTStatus($C0000037);

//
// MessageId: STATUS_DEVICE_ALREADY_ATTACHED
//
// MessageText:
//
// An attempt was made to attach to a device that was already attached to another device.
//
  {$EXTERNALSYM STATUS_DEVICE_ALREADY_ATTACHED}
  STATUS_DEVICE_ALREADY_ATTACHED   =  TNTStatus($C0000038);

//
// MessageId: STATUS_OBJECT_PATH_INVALID
//
// MessageText:
//
// Object Path Component was not a directory object.
//
  {$EXTERNALSYM STATUS_OBJECT_PATH_INVALID}
  STATUS_OBJECT_PATH_INVALID       =  TNTStatus($C0000039);

//
// MessageId: STATUS_OBJECT_PATH_NOT_FOUND
//
// MessageText:
//
// {Path Not Found}
// The path %hs does not exist.
//
  {$EXTERNALSYM STATUS_OBJECT_PATH_NOT_FOUND}
  STATUS_OBJECT_PATH_NOT_FOUND     =  TNTStatus($C000003A);

//
// MessageId: STATUS_OBJECT_PATH_SYNTAX_BAD
//
// MessageText:
//
// Object Path Component was not a directory object.
//
  {$EXTERNALSYM STATUS_OBJECT_PATH_SYNTAX_BAD}
  STATUS_OBJECT_PATH_SYNTAX_BAD    =  TNTStatus($C000003B);

//
// MessageId: STATUS_DATA_OVERRUN
//
// MessageText:
//
// {Data Overrun}
// A data overrun error occurred.
//
  {$EXTERNALSYM STATUS_DATA_OVERRUN}
  STATUS_DATA_OVERRUN              =  TNTStatus($C000003C);

//
// MessageId: STATUS_DATA_LATE_ERROR
//
// MessageText:
//
// {Data Late}
// A data late error occurred.
//
  {$EXTERNALSYM STATUS_DATA_LATE_ERROR}
  STATUS_DATA_LATE_ERROR           =  TNTStatus($C000003D);

//
// MessageId: STATUS_DATA_ERROR
//
// MessageText:
//
// {Data Error}
// An error in reading or writing data occurred.
//
  {$EXTERNALSYM STATUS_DATA_ERROR}
  STATUS_DATA_ERROR                =  TNTStatus($C000003E);

//
// MessageId: STATUS_CRC_ERROR
//
// MessageText:
//
// {Bad CRC}
// A cyclic redundancy check (CRC) checksum error occurred.
//
  {$EXTERNALSYM STATUS_CRC_ERROR}
  STATUS_CRC_ERROR                 =  TNTStatus($C000003F);

//
// MessageId: STATUS_SECTION_TOO_BIG
//
// MessageText:
//
// {Section Too Large}
// The specified section is too big to map the file.
//
  {$EXTERNALSYM STATUS_SECTION_TOO_BIG}
  STATUS_SECTION_TOO_BIG           =  TNTStatus($C0000040);

//
// MessageId: STATUS_PORT_CONNECTION_REFUSED
//
// MessageText:
//
// The NtConnectPort request is refused.
//
  {$EXTERNALSYM STATUS_PORT_CONNECTION_REFUSED}
  STATUS_PORT_CONNECTION_REFUSED   =  TNTStatus($C0000041);

//
// MessageId: STATUS_INVALID_PORT_HANDLE
//
// MessageText:
//
// The type of port handle is invalid for the operation requested.
//
  {$EXTERNALSYM STATUS_INVALID_PORT_HANDLE}
  STATUS_INVALID_PORT_HANDLE       =  TNTStatus($C0000042);

//
// MessageId: STATUS_SHARING_VIOLATION
//
// MessageText:
//
// A file cannot be opened because the share access flags are incompatible.
//
  {$EXTERNALSYM STATUS_SHARING_VIOLATION}
  STATUS_SHARING_VIOLATION         =  TNTStatus($C0000043);

//
// MessageId: STATUS_QUOTA_EXCEEDED
//
// MessageText:
//
// Insufficient quota exists to complete the operation
//
  {$EXTERNALSYM STATUS_QUOTA_EXCEEDED}
  STATUS_QUOTA_EXCEEDED            =  TNTStatus($C0000044);

//
// MessageId: STATUS_INVALID_PAGE_PROTECTION
//
// MessageText:
//
// The specified page protection was not valid.
//
  {$EXTERNALSYM STATUS_INVALID_PAGE_PROTECTION}
  STATUS_INVALID_PAGE_PROTECTION   =  TNTStatus($C0000045);

//
// MessageId: STATUS_MUTANT_NOT_OWNED
//
// MessageText:
//
// An attempt to release a mutant object was made by a thread that was not the owner of the mutant object.
//
  {$EXTERNALSYM STATUS_MUTANT_NOT_OWNED}
  STATUS_MUTANT_NOT_OWNED          =  TNTStatus($C0000046);

//
// MessageId: STATUS_SEMAPHORE_LIMIT_EXCEEDED
//
// MessageText:
//
// An attempt was made to release a semaphore such that its maximum count would have been exceeded.
//
  {$EXTERNALSYM STATUS_SEMAPHORE_LIMIT_EXCEEDED}
  STATUS_SEMAPHORE_LIMIT_EXCEEDED  =  TNTStatus($C0000047);

//
// MessageId: STATUS_PORT_ALREADY_SET
//
// MessageText:
//
// An attempt to set a processes DebugPort or ExceptionPort was made, but a port already exists in the process or
// an attempt to set a file's CompletionPort made, but a port was already set in the file or
// an attempt to set an alpc port's associated completion port was made, but it is already set.
//
  {$EXTERNALSYM STATUS_PORT_ALREADY_SET}
  STATUS_PORT_ALREADY_SET          =  TNTStatus($C0000048);

//
// MessageId: STATUS_SECTION_NOT_IMAGE
//
// MessageText:
//
// An attempt was made to query image information on a section which does not map an image.
//
  {$EXTERNALSYM STATUS_SECTION_NOT_IMAGE}
  STATUS_SECTION_NOT_IMAGE         =  TNTStatus($C0000049);

//
// MessageId: STATUS_SUSPEND_COUNT_EXCEEDED
//
// MessageText:
//
// An attempt was made to suspend a thread whose suspend count was at its maximum.
//
  {$EXTERNALSYM STATUS_SUSPEND_COUNT_EXCEEDED}
  STATUS_SUSPEND_COUNT_EXCEEDED    =  TNTStatus($C000004A);

//
// MessageId: STATUS_THREAD_IS_TERMINATING
//
// MessageText:
//
// An attempt was made to access a thread that has begun termination.
//
  {$EXTERNALSYM STATUS_THREAD_IS_TERMINATING}
  STATUS_THREAD_IS_TERMINATING     =  TNTStatus($C000004B);

//
// MessageId: STATUS_BAD_WORKING_SET_LIMIT
//
// MessageText:
//
// An attempt was made to set the working set limit to an invalid value (minimum greater than maximum, etc).
//
  {$EXTERNALSYM STATUS_BAD_WORKING_SET_LIMIT}
  STATUS_BAD_WORKING_SET_LIMIT     =  TNTStatus($C000004C);

//
// MessageId: STATUS_INCOMPATIBLE_FILE_MAP
//
// MessageText:
//
// A section was created to map a file which is not compatible to an already existing section which maps the same file.
//
  {$EXTERNALSYM STATUS_INCOMPATIBLE_FILE_MAP}
  STATUS_INCOMPATIBLE_FILE_MAP     =  TNTStatus($C000004D);

//
// MessageId: STATUS_SECTION_PROTECTION
//
// MessageText:
//
// A view to a section specifies a protection which is incompatible with the initial view's protection.
//
  {$EXTERNALSYM STATUS_SECTION_PROTECTION}
  STATUS_SECTION_PROTECTION        =  TNTStatus($C000004E);

//
// MessageId: STATUS_EAS_NOT_SUPPORTED
//
// MessageText:
//
// An operation involving EAs failed because the file system does not support EAs.
//
  {$EXTERNALSYM STATUS_EAS_NOT_SUPPORTED}
  STATUS_EAS_NOT_SUPPORTED         =  TNTStatus($C000004F);

//
// MessageId: STATUS_EA_TOO_LARGE
//
// MessageText:
//
// An EA operation failed because EA set is too large.
//
  {$EXTERNALSYM STATUS_EA_TOO_LARGE}
  STATUS_EA_TOO_LARGE              =  TNTStatus($C0000050);

//
// MessageId: STATUS_NONEXISTENT_EA_ENTRY
//
// MessageText:
//
// An EA operation failed because the name or EA index is invalid.
//
  {$EXTERNALSYM STATUS_NONEXISTENT_EA_ENTRY}
  STATUS_NONEXISTENT_EA_ENTRY      =  TNTStatus($C0000051);

//
// MessageId: STATUS_NO_EAS_ON_FILE
//
// MessageText:
//
// The file for which EAs were requested has no EAs.
//
  {$EXTERNALSYM STATUS_NO_EAS_ON_FILE}
  STATUS_NO_EAS_ON_FILE            =  TNTStatus($C0000052);

//
// MessageId: STATUS_EA_CORRUPT_ERROR
//
// MessageText:
//
// The EA is corrupt and non-readable.
//
  {$EXTERNALSYM STATUS_EA_CORRUPT_ERROR}
  STATUS_EA_CORRUPT_ERROR          =  TNTStatus($C0000053);

//
// MessageId: STATUS_FILE_LOCK_CONFLICT
//
// MessageText:
//
// A requested read/write cannot be granted due to a conflicting file lock.
//
  {$EXTERNALSYM STATUS_FILE_LOCK_CONFLICT}
  STATUS_FILE_LOCK_CONFLICT        =  TNTStatus($C0000054);

//
// MessageId: STATUS_LOCK_NOT_GRANTED
//
// MessageText:
//
// A requested file lock cannot be granted due to other existing locks.
//
  {$EXTERNALSYM STATUS_LOCK_NOT_GRANTED}
  STATUS_LOCK_NOT_GRANTED          =  TNTStatus($C0000055);

//
// MessageId: STATUS_DELETE_PENDING
//
// MessageText:
//
// A non close operation has been requested of a file object with a delete pending.
//
  {$EXTERNALSYM STATUS_DELETE_PENDING}
  STATUS_DELETE_PENDING            =  TNTStatus($C0000056);

//
// MessageId: STATUS_CTL_FILE_NOT_SUPPORTED
//
// MessageText:
//
// An attempt was made to set the control attribute on a file. This attribute is not supported in the target file system.
//
  {$EXTERNALSYM STATUS_CTL_FILE_NOT_SUPPORTED}
  STATUS_CTL_FILE_NOT_SUPPORTED    =  TNTStatus($C0000057);

//
// MessageId: STATUS_UNKNOWN_REVISION
//
// MessageText:
//
// Indicates a revision number encountered or specified is not one known by the service. It may be a more recent revision than the service is aware of.
//
  {$EXTERNALSYM STATUS_UNKNOWN_REVISION}
  STATUS_UNKNOWN_REVISION          =  TNTStatus($C0000058);

//
// MessageId: STATUS_REVISION_MISMATCH
//
// MessageText:
//
// Indicates two revision levels are incompatible.
//
  {$EXTERNALSYM STATUS_REVISION_MISMATCH}
  STATUS_REVISION_MISMATCH         =  TNTStatus($C0000059);

//
// MessageId: STATUS_INVALID_OWNER
//
// MessageText:
//
// Indicates a particular Security ID may not be assigned as the owner of an object.
//
  {$EXTERNALSYM STATUS_INVALID_OWNER}
  STATUS_INVALID_OWNER             =  TNTStatus($C000005A);

//
// MessageId: STATUS_INVALID_PRIMARY_GROUP
//
// MessageText:
//
// Indicates a particular Security ID may not be assigned as the primary group of an object.
//
  {$EXTERNALSYM STATUS_INVALID_PRIMARY_GROUP}
  STATUS_INVALID_PRIMARY_GROUP     =  TNTStatus($C000005B);

//
// MessageId: STATUS_NO_IMPERSONATION_TOKEN
//
// MessageText:
//
// An attempt has been made to operate on an impersonation token by a thread that is not currently impersonating a client.
//
  {$EXTERNALSYM STATUS_NO_IMPERSONATION_TOKEN}
  STATUS_NO_IMPERSONATION_TOKEN    =  TNTStatus($C000005C);

//
// MessageId: STATUS_CANT_DISABLE_MANDATORY
//
// MessageText:
//
// A mandatory group may not be disabled.
//
  {$EXTERNALSYM STATUS_CANT_DISABLE_MANDATORY}
  STATUS_CANT_DISABLE_MANDATORY    =  TNTStatus($C000005D);

//
// MessageId: STATUS_NO_LOGON_SERVERS
//
// MessageText:
//
// There are currently no logon servers available to service the logon request.
//
  {$EXTERNALSYM STATUS_NO_LOGON_SERVERS}
  STATUS_NO_LOGON_SERVERS          =  TNTStatus($C000005E);

//
// MessageId: STATUS_NO_SUCH_LOGON_SESSION
//
// MessageText:
//
// A specified logon session does not exist. It may already have been terminated.
//
  {$EXTERNALSYM STATUS_NO_SUCH_LOGON_SESSION}
  STATUS_NO_SUCH_LOGON_SESSION     =  TNTStatus($C000005F);

//
// MessageId: STATUS_NO_SUCH_PRIVILEGE
//
// MessageText:
//
// A specified privilege does not exist.
//
  {$EXTERNALSYM STATUS_NO_SUCH_PRIVILEGE}
  STATUS_NO_SUCH_PRIVILEGE         =  TNTStatus($C0000060);

//
// MessageId: STATUS_PRIVILEGE_NOT_HELD
//
// MessageText:
//
// A required privilege is not held by the client.
//
  {$EXTERNALSYM STATUS_PRIVILEGE_NOT_HELD}
  STATUS_PRIVILEGE_NOT_HELD        =  TNTStatus($C0000061);

//
// MessageId: STATUS_INVALID_ACCOUNT_NAME
//
// MessageText:
//
// The name provided is not a properly formed account name.
//
  {$EXTERNALSYM STATUS_INVALID_ACCOUNT_NAME}
  STATUS_INVALID_ACCOUNT_NAME      =  TNTStatus($C0000062);

//
// MessageId: STATUS_USER_EXISTS
//
// MessageText:
//
// The specified account already exists.
//
  {$EXTERNALSYM STATUS_USER_EXISTS}
  STATUS_USER_EXISTS               =  TNTStatus($C0000063);

//
// MessageId: STATUS_NO_SUCH_USER
//
// MessageText:
//
// The specified account does not exist.
//
  {$EXTERNALSYM STATUS_NO_SUCH_USER}
  STATUS_NO_SUCH_USER              =  TNTStatus($C0000064);     // ntsubauth

//
// MessageId: STATUS_GROUP_EXISTS
//
// MessageText:
//
// The specified group already exists.
//
  {$EXTERNALSYM STATUS_GROUP_EXISTS}
  STATUS_GROUP_EXISTS              =  TNTStatus($C0000065);

//
// MessageId: STATUS_NO_SUCH_GROUP
//
// MessageText:
//
// The specified group does not exist.
//
  {$EXTERNALSYM STATUS_NO_SUCH_GROUP}
  STATUS_NO_SUCH_GROUP             =  TNTStatus($C0000066);

//
// MessageId: STATUS_MEMBER_IN_GROUP
//
// MessageText:
//
// The specified user account is already in the specified group account.
// Also used to indicate a group cannot be deleted because it contains a member.
//
  {$EXTERNALSYM STATUS_MEMBER_IN_GROUP}
  STATUS_MEMBER_IN_GROUP           =  TNTStatus($C0000067);

//
// MessageId: STATUS_MEMBER_NOT_IN_GROUP
//
// MessageText:
//
// The specified user account is not a member of the specified group account.
//
  {$EXTERNALSYM STATUS_MEMBER_NOT_IN_GROUP}
  STATUS_MEMBER_NOT_IN_GROUP       =  TNTStatus($C0000068);

//
// MessageId: STATUS_LAST_ADMIN
//
// MessageText:
//
// Indicates the requested operation would disable or delete the last remaining administration account.
// This is not allowed to prevent creating a situation in which the system cannot be administrated.
//
  {$EXTERNALSYM STATUS_LAST_ADMIN}
  STATUS_LAST_ADMIN                =  TNTStatus($C0000069);

//
// MessageId: STATUS_WRONG_PASSWORD
//
// MessageText:
//
// When trying to update a password, this return status indicates that the value provided as the current password is not correct.
//
  {$EXTERNALSYM STATUS_WRONG_PASSWORD}
  STATUS_WRONG_PASSWORD            =  TNTStatus($C000006A);     // ntsubauth

//
// MessageId: STATUS_ILL_FORMED_PASSWORD
//
// MessageText:
//
// When trying to update a password, this return status indicates that the value provided for the new password contains values that are not allowed in passwords.
//
  {$EXTERNALSYM STATUS_ILL_FORMED_PASSWORD}
  STATUS_ILL_FORMED_PASSWORD       =  TNTStatus($C000006B);

//
// MessageId: STATUS_PASSWORD_RESTRICTION
//
// MessageText:
//
// When trying to update a password, this status indicates that some password update rule has been violated. For example, the password may not meet length criteria.
//
  {$EXTERNALSYM STATUS_PASSWORD_RESTRICTION}
  STATUS_PASSWORD_RESTRICTION      =  TNTStatus($C000006C);     // ntsubauth;

//
// MessageId: STATUS_LOGON_FAILURE
//
// MessageText:
//
// The attempted logon is invalid. This is either due to a bad username or authentication information.
//
  {$EXTERNALSYM STATUS_LOGON_FAILURE}
  STATUS_LOGON_FAILURE             =  TNTStatus($C000006D);     // ntsubauth;

//
// MessageId: STATUS_ACCOUNT_RESTRICTION
//
// MessageText:
//
// Indicates a referenced user name and authentication information are valid, but some user account restriction has prevented successful authentication (such as time-of-day restrictions).
//
  {$EXTERNALSYM STATUS_ACCOUNT_RESTRICTION}
  STATUS_ACCOUNT_RESTRICTION       =  TNTStatus($C000006E);     // ntsubauth

//
// MessageId: STATUS_INVALID_LOGON_HOURS
//
// MessageText:
//
// The user account has time restrictions and may not be logged onto at this time.
//
  {$EXTERNALSYM STATUS_INVALID_LOGON_HOURS}
  STATUS_INVALID_LOGON_HOURS       =  TNTStatus($C000006F);     // ntsubauth

//
// MessageId: STATUS_INVALID_WORKSTATION
//
// MessageText:
//
// The user account is restricted such that it may not be used to log on from the source workstation.
//
  {$EXTERNALSYM STATUS_INVALID_WORKSTATION}
  STATUS_INVALID_WORKSTATION       =  TNTStatus($C0000070);     // ntsubauth

//
// MessageId: STATUS_PASSWORD_EXPIRED
//
// MessageText:
//
// The user account's password has expired.
//
  {$EXTERNALSYM STATUS_PASSWORD_EXPIRED}
  STATUS_PASSWORD_EXPIRED          =  TNTStatus($C0000071);     // ntsubauth

//
// MessageId: STATUS_ACCOUNT_DISABLED
//
// MessageText:
//
// The referenced account is currently disabled and may not be logged on to.
//
  {$EXTERNALSYM STATUS_ACCOUNT_DISABLED}
  STATUS_ACCOUNT_DISABLED          =  TNTStatus($C0000072);     // ntsubauth

//
// MessageId: STATUS_NONE_MAPPED
//
// MessageText:
//
// None of the information to be translated has been translated.
//
  {$EXTERNALSYM STATUS_NONE_MAPPED}
  STATUS_NONE_MAPPED               =  TNTStatus($C0000073);

//
// MessageId: STATUS_TOO_MANY_LUIDS_REQUESTED
//
// MessageText:
//
// The number of LUIDs requested may not be allocated with a single allocation.
//
  {$EXTERNALSYM STATUS_TOO_MANY_LUIDS_REQUESTED}
  STATUS_TOO_MANY_LUIDS_REQUESTED  =  TNTStatus($C0000074);

//
// MessageId: STATUS_LUIDS_EXHAUSTED
//
// MessageText:
//
// Indicates there are no more LUIDs to allocate.
//
  {$EXTERNALSYM STATUS_LUIDS_EXHAUSTED}
  STATUS_LUIDS_EXHAUSTED           =  TNTStatus($C0000075);

//
// MessageText:
//
// Indicates the sub-authority value is invalid for the particular use.
//
  {$EXTERNALSYM STATUS_INVALID_SUB_AUTHORITY}
  STATUS_INVALID_SUB_AUTHORITY     =  TNTStatus($C0000076);

//
// MessageId: STATUS_INVALID_ACL
//
// MessageText:
//
// Indicates the ACL structure is not valid.
//
  {$EXTERNALSYM STATUS_INVALID_ACL}
  STATUS_INVALID_ACL               =  TNTStatus($C0000077);

//
// MessageId: STATUS_INVALID_SID
//
// MessageText:
//
// Indicates the SID structure is not valid.
//
  {$EXTERNALSYM STATUS_INVALID_SID}
  STATUS_INVALID_SID               =  TNTStatus($C0000078);

//
// MessageId: STATUS_INVALID_SECURITY_DESCR
//
// MessageText:
//
// Indicates the SECURITY_DESCRIPTOR structure is not valid.
//
  {$EXTERNALSYM STATUS_INVALID_SECURITY_DESCR}
  STATUS_INVALID_SECURITY_DESCR    =  TNTStatus($C0000079);

//
// MessageId: STATUS_PROCEDURE_NOT_FOUND
//
// MessageText:
//
// Indicates the specified procedure address cannot be found in the DLL.
//
  {$EXTERNALSYM STATUS_PROCEDURE_NOT_FOUND}
  STATUS_PROCEDURE_NOT_FOUND       =  TNTStatus($C000007A);

//
// MessageId: STATUS_INVALID_IMAGE_FORMAT
//
// MessageText:
//
// {Bad Image}
// %hs is either not designed to run on Windows or it contains an error. Try installing the program again using the original installation media or contact your system administrator or the software vendor for support.
//
  {$EXTERNALSYM STATUS_INVALID_IMAGE_FORMAT}
  STATUS_INVALID_IMAGE_FORMAT      =  TNTStatus($C000007B);

//
// MessageId: STATUS_NO_TOKEN
//
// MessageText:
//
// An attempt was made to reference a token that doesn't exist.
// This is typically done by referencing the token associated with a thread when the thread is not impersonating a client.
//
  {$EXTERNALSYM STATUS_NO_TOKEN}
  STATUS_NO_TOKEN                  =  TNTStatus($C000007C);

//
// MessageId: STATUS_BAD_INHERITANCE_ACL
//
// MessageText:
//
// Indicates that an attempt to build either an inherited ACL or ACE was not successful.
// This can be caused by a number of things. One of the more probable causes is the replacement of a CreatorId with an SID that didn't fit into the ACE or ACL.
//
  {$EXTERNALSYM STATUS_BAD_INHERITANCE_ACL}
  STATUS_BAD_INHERITANCE_ACL       =  TNTStatus($C000007D);

//
// MessageId: STATUS_RANGE_NOT_LOCKED
//
// MessageText:
//
// The range specified in NtUnlockFile was not locked.
//
  {$EXTERNALSYM STATUS_RANGE_NOT_LOCKED}
  STATUS_RANGE_NOT_LOCKED          =  TNTStatus($C000007E);

//
// MessageId: STATUS_DISK_FULL
//
// MessageText:
//
// An operation failed because the disk was full.
//
  {$EXTERNALSYM STATUS_DISK_FULL}
  STATUS_DISK_FULL                 =  TNTStatus($C000007F);

//
// MessageId: STATUS_SERVER_DISABLED
//
// MessageText:
//
// The GUID allocation server is [already] disabled at the moment.
//
  {$EXTERNALSYM STATUS_SERVER_DISABLED}
  STATUS_SERVER_DISABLED           =  TNTStatus($C0000080);

//
// MessageId: STATUS_SERVER_NOT_DISABLED
//
// MessageText:
//
// The GUID allocation server is [already] enabled at the moment.
//
  {$EXTERNALSYM STATUS_SERVER_NOT_DISABLED}
  STATUS_SERVER_NOT_DISABLED       =  TNTStatus($C0000081);

//
// MessageId: STATUS_TOO_MANY_GUIDS_REQUESTED
//
// MessageText:
//
// Too many GUIDs were requested from the allocation server at once.
//
  {$EXTERNALSYM STATUS_TOO_MANY_GUIDS_REQUESTED}
  STATUS_TOO_MANY_GUIDS_REQUESTED  =  TNTStatus($C0000082);

//
// MessageId: STATUS_GUIDS_EXHAUSTED
//
// MessageText:
//
// The GUIDs could not be allocated because the Authority Agent was exhausted.
//
  {$EXTERNALSYM STATUS_GUIDS_EXHAUSTED}
  STATUS_GUIDS_EXHAUSTED           =  TNTStatus($C0000083);

//
// MessageId: STATUS_INVALID_ID_AUTHORITY
//
// MessageText:
//
// The value provided was an invalid value for an identifier authority.
//
  {$EXTERNALSYM STATUS_INVALID_ID_AUTHORITY}
  STATUS_INVALID_ID_AUTHORITY      =  TNTStatus($C0000084);

//
// MessageId: STATUS_AGENTS_EXHAUSTED
//
// MessageText:
//
// There are no more authority agent values available for the given identifier authority value.
//
  {$EXTERNALSYM STATUS_AGENTS_EXHAUSTED}
  STATUS_AGENTS_EXHAUSTED          =  TNTStatus($C0000085);

//
// MessageId: STATUS_INVALID_VOLUME_LABEL
//
// MessageText:
//
// An invalid volume label has been specified.
//
  {$EXTERNALSYM STATUS_INVALID_VOLUME_LABEL}
  STATUS_INVALID_VOLUME_LABEL      =  TNTStatus($C0000086);

//
// MessageId: STATUS_SECTION_NOT_EXTENDED
//
// MessageText:
//
// A mapped section could not be extended.
//
  {$EXTERNALSYM STATUS_SECTION_NOT_EXTENDED}
  STATUS_SECTION_NOT_EXTENDED      =  TNTStatus($C0000087);

//
// MessageId: STATUS_NOT_MAPPED_DATA
//
// MessageText:
//
// Specified section to flush does not map a data file.
//
  {$EXTERNALSYM STATUS_NOT_MAPPED_DATA}
  STATUS_NOT_MAPPED_DATA           =  TNTStatus($C0000088);

//
// MessageId: STATUS_RESOURCE_DATA_NOT_FOUND
//
// MessageText:
//
// Indicates the specified image file did not contain a resource section.
//
  {$EXTERNALSYM STATUS_RESOURCE_DATA_NOT_FOUND}
  STATUS_RESOURCE_DATA_NOT_FOUND   =  TNTStatus($C0000089);

//
// MessageId: STATUS_RESOURCE_TYPE_NOT_FOUND
//
// MessageText:
//
// Indicates the specified resource type cannot be found in the image file.
//
  {$EXTERNALSYM STATUS_RESOURCE_TYPE_NOT_FOUND}
  STATUS_RESOURCE_TYPE_NOT_FOUND   =  TNTStatus($C000008A);

//
// MessageId: STATUS_RESOURCE_NAME_NOT_FOUND
//
// MessageText:
//
// Indicates the specified resource name cannot be found in the image file.
//
  {$EXTERNALSYM STATUS_RESOURCE_NAME_NOT_FOUND}
  STATUS_RESOURCE_NAME_NOT_FOUND   =  TNTStatus($C000008B);

//
// MessageId: STATUS_ARRAY_BOUNDS_EXCEEDED
//
// MessageText:
//
// {EXCEPTION}
// Array bounds exceeded.
//
  {$EXTERNALSYM STATUS_ARRAY_BOUNDS_EXCEEDED}
  STATUS_ARRAY_BOUNDS_EXCEEDED     =  TNTStatus($C000008C);    // winnt

//
// MessageId: STATUS_FLOAT_DENORMAL_OPERAND
//
// MessageText:
//
// {EXCEPTION}
// Floating-point denormal operand.
//
  {$EXTERNALSYM STATUS_FLOAT_DENORMAL_OPERAND}
  STATUS_FLOAT_DENORMAL_OPERAND    =  TNTStatus($C000008D);    // winnt

//
// MessageId: STATUS_FLOAT_DIVIDE_BY_ZERO
//
// MessageText:
//
// {EXCEPTION}
// Floating-point division by zero.
//
  {$EXTERNALSYM STATUS_FLOAT_DIVIDE_BY_ZERO}
  STATUS_FLOAT_DIVIDE_BY_ZERO      =  TNTStatus($C000008E);    // winnt

//
// MessageId: STATUS_FLOAT_INEXACT_RESULT
//
// MessageText:
//
// {EXCEPTION}
// Floating-point inexact result.
//
  {$EXTERNALSYM STATUS_FLOAT_INEXACT_RESULT}
  STATUS_FLOAT_INEXACT_RESULT      =  TNTStatus($C000008F);    // winnt

//
// MessageId: STATUS_FLOAT_INVALID_OPERATION
//
// MessageText:
//
// {EXCEPTION}
// Floating-point invalid operation.
//
  {$EXTERNALSYM STATUS_FLOAT_INVALID_OPERATION}
  STATUS_FLOAT_INVALID_OPERATION   =  TNTStatus($C0000090);    // winnt

//
// MessageId: STATUS_FLOAT_OVERFLOW
//
// MessageText:
//
// {EXCEPTION}
// Floating-point overflow.
//
  {$EXTERNALSYM STATUS_FLOAT_OVERFLOW}
  STATUS_FLOAT_OVERFLOW            =  TNTStatus($C0000091);    // winnt

//
// MessageId: STATUS_FLOAT_STACK_CHECK
//
// MessageText:
//
// {EXCEPTION}
// Floating-point stack check.
//
  {$EXTERNALSYM STATUS_FLOAT_STACK_CHECK}
  STATUS_FLOAT_STACK_CHECK         =  TNTStatus($C0000092);    // winnt

//
// MessageId: STATUS_FLOAT_UNDERFLOW
//
// MessageText:
//
// {EXCEPTION}
// Floating-point underflow.
//
  {$EXTERNALSYM STATUS_FLOAT_UNDERFLOW}
  STATUS_FLOAT_UNDERFLOW           =  TNTStatus($C0000093);    // winnt

//
// MessageId: STATUS_INTEGER_DIVIDE_BY_ZERO
//
// MessageText:
//
// {EXCEPTION}
// Integer division by zero.
//
  {$EXTERNALSYM STATUS_INTEGER_DIVIDE_BY_ZERO}
  STATUS_INTEGER_DIVIDE_BY_ZERO    =  TNTStatus($C0000094);    // winnt

//
// MessageId: STATUS_INTEGER_OVERFLOW
//
// MessageText:
//
// {EXCEPTION}
// Integer overflow.
//
  {$EXTERNALSYM STATUS_INTEGER_OVERFLOW}
  STATUS_INTEGER_OVERFLOW          =  TNTStatus($C0000095);    // winnt

//
// MessageId: STATUS_PRIVILEGED_INSTRUCTION
//
// MessageText:
//
// {EXCEPTION}
// Privileged instruction.
//
  {$EXTERNALSYM STATUS_PRIVILEGED_INSTRUCTION}
  STATUS_PRIVILEGED_INSTRUCTION    =  TNTStatus($C0000096);    // winnt

//
// MessageId: STATUS_TOO_MANY_PAGING_FILES
//
// MessageText:
//
// An attempt was made to install more paging files than the system supports.
//
  {$EXTERNALSYM STATUS_TOO_MANY_PAGING_FILES}
  STATUS_TOO_MANY_PAGING_FILES     =  TNTStatus($C0000097);

//
// MessageId: STATUS_FILE_INVALID
//
// MessageText:
//
// The volume for a file has been externally altered such that the opened file is no longer valid.
//
  {$EXTERNALSYM STATUS_FILE_INVALID}
  STATUS_FILE_INVALID              =  TNTStatus($C0000098);

//
// MessageId: STATUS_ALLOTTED_SPACE_EXCEEDED
//
// MessageText:
//
// When a block of memory is allotted for future updates, such as the memory allocated to hold discretionary access control and primary group information, successive updates may exceed the amount of memory originally allotted.
// Since quota may already have been charged to several processes which have handles to the object, it is not reasonable to alter the size of the allocated memory.
// Instead, a request that requires more memory than has been allotted must fail and the STATUS_ALLOTED_SPACE_EXCEEDED error returned.
//
  {$EXTERNALSYM STATUS_ALLOTTED_SPACE_EXCEEDED}
  STATUS_ALLOTTED_SPACE_EXCEEDED   =  TNTStatus($C0000099);

//
// MessageId: STATUS_INSUFFICIENT_RESOURCES
//
// MessageText:
//
// Insufficient system resources exist to complete the API.
//
  {$EXTERNALSYM STATUS_INSUFFICIENT_RESOURCES}
  STATUS_INSUFFICIENT_RESOURCES    =  TNTStatus($C000009A);     // ntsubauth

//
// MessageId: STATUS_DFS_EXIT_PATH_FOUND
//
// MessageText:
//
// An attempt has been made to open a DFS exit path control file.
//
  {$EXTERNALSYM STATUS_DFS_EXIT_PATH_FOUND}
  STATUS_DFS_EXIT_PATH_FOUND       =  TNTStatus($C000009B);

//
// MessageId: STATUS_DEVICE_DATA_ERROR
//
// MessageText:
//
//  STATUS_DEVICE_DATA_ERROR
//
  {$EXTERNALSYM STATUS_DEVICE_DATA_ERROR}
  STATUS_DEVICE_DATA_ERROR         =  TNTStatus($C000009C);

//
// MessageId: STATUS_DEVICE_NOT_CONNECTED
//
// MessageText:
//
//  STATUS_DEVICE_NOT_CONNECTED
//
  {$EXTERNALSYM STATUS_DEVICE_NOT_CONNECTED}
  STATUS_DEVICE_NOT_CONNECTED      =  TNTStatus($C000009D);

//
// MessageId: STATUS_DEVICE_POWER_FAILURE
//
// MessageText:
//
//  STATUS_DEVICE_POWER_FAILURE
//
  {$EXTERNALSYM STATUS_DEVICE_POWER_FAILURE}
  STATUS_DEVICE_POWER_FAILURE      =  TNTStatus($C000009E);

//
// MessageId: STATUS_FREE_VM_NOT_AT_BASE
//
// MessageText:
//
// Virtual memory cannot be freed as base address is not the base of the region and a region size of zero was specified.
//
  {$EXTERNALSYM STATUS_FREE_VM_NOT_AT_BASE}
  STATUS_FREE_VM_NOT_AT_BASE       =  TNTStatus($C000009F);

//
// MessageId: STATUS_MEMORY_NOT_ALLOCATED
//
// MessageText:
//
// An attempt was made to free virtual memory which is not allocated.
//
  {$EXTERNALSYM STATUS_MEMORY_NOT_ALLOCATED}
  STATUS_MEMORY_NOT_ALLOCATED      =  TNTStatus($C00000A0);

//
// MessageId: STATUS_WORKING_SET_QUOTA
//
// MessageText:
//
// The working set is not big enough to allow the requested pages to be locked.
//
  {$EXTERNALSYM STATUS_WORKING_SET_QUOTA}
  STATUS_WORKING_SET_QUOTA         =  TNTStatus($C00000A1);

//
// MessageId: STATUS_MEDIA_WRITE_PROTECTED
//
// MessageText:
//
// {Write Protect Error}
// The disk cannot be written to because it is write protected.
// Please remove the write protection from the volume %hs in drive %hs.
//
  {$EXTERNALSYM STATUS_MEDIA_WRITE_PROTECTED}
  STATUS_MEDIA_WRITE_PROTECTED     =  TNTStatus($C00000A2);

//
// MessageId: STATUS_DEVICE_NOT_READY
//
// MessageText:
//
// {Drive Not Ready}
// The drive is not ready for use; its door may be open.
// Please check drive %hs and make sure that a disk is inserted and that the drive door is closed.
//
  {$EXTERNALSYM STATUS_DEVICE_NOT_READY}
  STATUS_DEVICE_NOT_READY          =  TNTStatus($C00000A3);

//
// MessageId: STATUS_INVALID_GROUP_ATTRIBUTES
//
// MessageText:
//
// The specified attributes are invalid, or incompatible with the attributes for the group as a whole.
//
  {$EXTERNALSYM STATUS_INVALID_GROUP_ATTRIBUTES}
  STATUS_INVALID_GROUP_ATTRIBUTES  =  TNTStatus($C00000A4);

//
// MessageId: STATUS_BAD_IMPERSONATION_LEVEL
//
// MessageText:
//
// A specified impersonation level is invalid.
// Also used to indicate a required impersonation level was not provided.
//
  {$EXTERNALSYM STATUS_BAD_IMPERSONATION_LEVEL}
  STATUS_BAD_IMPERSONATION_LEVEL   =  TNTStatus($C00000A5);

//
// MessageId: STATUS_CANT_OPEN_ANONYMOUS
//
// MessageText:
//
// An attempt was made to open an Anonymous level token.
// Anonymous tokens may not be opened.
//
  {$EXTERNALSYM STATUS_CANT_OPEN_ANONYMOUS}
  STATUS_CANT_OPEN_ANONYMOUS       =  TNTStatus($C00000A6);

//
// MessageId: STATUS_BAD_VALIDATION_CLASS
//
// MessageText:
//
// The validation information class requested was invalid.
//
  {$EXTERNALSYM STATUS_BAD_VALIDATION_CLASS}
  STATUS_BAD_VALIDATION_CLASS      =  TNTStatus($C00000A7);

//
// MessageId: STATUS_BAD_TOKEN_TYPE
//
// MessageText:
//
// The type of a token object is inappropriate for its attempted use.
//
  {$EXTERNALSYM STATUS_BAD_TOKEN_TYPE}
  STATUS_BAD_TOKEN_TYPE            =  TNTStatus($C00000A8);

//
// MessageId: STATUS_BAD_MASTER_BOOT_RECORD
//
// MessageText:
//
// The type of a token object is inappropriate for its attempted use.
//
  {$EXTERNALSYM STATUS_BAD_MASTER_BOOT_RECORD}
  STATUS_BAD_MASTER_BOOT_RECORD    =  TNTStatus($C00000A9);

//
// MessageId: STATUS_INSTRUCTION_MISALIGNMENT
//
// MessageText:
//
// An attempt was made to execute an instruction at an unaligned address and the host system does not support unaligned instruction references.
//
  {$EXTERNALSYM STATUS_INSTRUCTION_MISALIGNMENT}
  STATUS_INSTRUCTION_MISALIGNMENT  =  TNTStatus($C00000AA);

//
// MessageId: STATUS_INSTANCE_NOT_AVAILABLE
//
// MessageText:
//
// The maximum named pipe instance count has been reached.
//
  {$EXTERNALSYM STATUS_INSTANCE_NOT_AVAILABLE}
  STATUS_INSTANCE_NOT_AVAILABLE    =  TNTStatus($C00000AB);

//
// MessageId: STATUS_PIPE_NOT_AVAILABLE
//
// MessageText:
//
// An instance of a named pipe cannot be found in the listening state.
//
  {$EXTERNALSYM STATUS_PIPE_NOT_AVAILABLE}
  STATUS_PIPE_NOT_AVAILABLE        =  TNTStatus($C00000AC);

//
// MessageId: STATUS_INVALID_PIPE_STATE
//
// MessageText:
//
// The named pipe is not in the connected or closing state.
//
  {$EXTERNALSYM STATUS_INVALID_PIPE_STATE}
  STATUS_INVALID_PIPE_STATE        =  TNTStatus($C00000AD);

//
// MessageId: STATUS_PIPE_BUSY
//
// MessageText:
//
// The specified pipe is set to complete operations and there are current I/O operations queued so it cannot be changed to queue operations.
//
  {$EXTERNALSYM STATUS_PIPE_BUSY}
  STATUS_PIPE_BUSY                 =  TNTStatus($C00000AE);

//
// MessageId: STATUS_ILLEGAL_FUNCTION
//
// MessageText:
//
// The specified handle is not open to the server end of the named pipe.
//
  {$EXTERNALSYM STATUS_ILLEGAL_FUNCTION}
  STATUS_ILLEGAL_FUNCTION          =  TNTStatus($C00000AF);

//
// MessageId: STATUS_PIPE_DISCONNECTED
//
// MessageText:
//
// The specified named pipe is in the disconnected state.
//
  {$EXTERNALSYM STATUS_PIPE_DISCONNECTED}
  STATUS_PIPE_DISCONNECTED         =  TNTStatus($C00000B0);

//
// MessageId: STATUS_PIPE_CLOSING
//
// MessageText:
//
// The specified named pipe is in the closing state.
//
  {$EXTERNALSYM STATUS_PIPE_CLOSING}
  STATUS_PIPE_CLOSING              =  TNTStatus($C00000B1);

//
// MessageId: STATUS_PIPE_CONNECTED
//
// MessageText:
//
// The specified named pipe is in the connected state.
//
  {$EXTERNALSYM STATUS_PIPE_CONNECTED}
  STATUS_PIPE_CONNECTED            =  TNTStatus($C00000B2);

//
// MessageId: STATUS_PIPE_LISTENING
//
// MessageText:
//
// The specified named pipe is in the listening state.
//
  {$EXTERNALSYM STATUS_PIPE_LISTENING}
  STATUS_PIPE_LISTENING            =  TNTStatus($C00000B3);

//
// MessageId: STATUS_INVALID_READ_MODE
//
// MessageText:
//
// The specified named pipe is not in message mode.
//
  {$EXTERNALSYM STATUS_INVALID_READ_MODE}
  STATUS_INVALID_READ_MODE         =  TNTStatus($C00000B4);

//
// MessageId: STATUS_IO_TIMEOUT
//
// MessageText:
//
// {Device Timeout}
// The specified I/O operation on %hs was not completed before the time-out period expired.
//
  {$EXTERNALSYM STATUS_IO_TIMEOUT}
  STATUS_IO_TIMEOUT                =  TNTStatus($C00000B5);

//
// MessageId: STATUS_FILE_FORCED_CLOSED
//
// MessageText:
//
// The specified file has been closed by another process.
//
  {$EXTERNALSYM STATUS_FILE_FORCED_CLOSED}
  STATUS_FILE_FORCED_CLOSED        =  TNTStatus($C00000B6);

//
// MessageId: STATUS_PROFILING_NOT_STARTED
//
// MessageText:
//
// Profiling not started.
//
  {$EXTERNALSYM STATUS_PROFILING_NOT_STARTED}
  STATUS_PROFILING_NOT_STARTED     =  TNTStatus($C00000B7);

//
// MessageId: STATUS_PROFILING_NOT_STOPPED
//
// MessageText:
//
// Profiling not stopped.
//
  {$EXTERNALSYM STATUS_PROFILING_NOT_STOPPED}
  STATUS_PROFILING_NOT_STOPPED     =  TNTStatus($C00000B8);

//
// MessageId: STATUS_COULD_NOT_INTERPRET
//
// MessageText:
//
// The passed ACL did not contain the minimum required information.
//
  {$EXTERNALSYM STATUS_COULD_NOT_INTERPRET}
  STATUS_COULD_NOT_INTERPRET       =  TNTStatus($C00000B9);

//
// MessageId: STATUS_FILE_IS_A_DIRECTORY
//
// MessageText:
//
// The file that was specified as a target is a directory and the caller specified that it could be anything but a directory.
//
  {$EXTERNALSYM STATUS_FILE_IS_A_DIRECTORY}
  STATUS_FILE_IS_A_DIRECTORY       =  TNTStatus($C00000BA);

//
// Network specific errors.
//
//
//
// MessageId: STATUS_NOT_SUPPORTED
//
// MessageText:
//
// The request is not supported.
//
  {$EXTERNALSYM STATUS_NOT_SUPPORTED}
  STATUS_NOT_SUPPORTED             =  TNTStatus($C00000BB);

//
// MessageId: STATUS_REMOTE_NOT_LISTENING
//
// MessageText:
//
// This remote computer is not listening.
//
  {$EXTERNALSYM STATUS_REMOTE_NOT_LISTENING}
  STATUS_REMOTE_NOT_LISTENING      =  TNTStatus($C00000BC);

//
// MessageId: STATUS_DUPLICATE_NAME
//
// MessageText:
//
// A duplicate name exists on the network.
//
  {$EXTERNALSYM STATUS_DUPLICATE_NAME}
  STATUS_DUPLICATE_NAME            =  TNTStatus($C00000BD);

//
// MessageId: STATUS_BAD_NETWORK_PATH
//
// MessageText:
//
// The network path cannot be located.
//
  {$EXTERNALSYM STATUS_BAD_NETWORK_PATH}
  STATUS_BAD_NETWORK_PATH          =  TNTStatus($C00000BE);

//
// MessageId: STATUS_NETWORK_BUSY
//
// MessageText:
//
// The network is busy.
//
  {$EXTERNALSYM STATUS_NETWORK_BUSY}
  STATUS_NETWORK_BUSY              =  TNTStatus($C00000BF);

//
// MessageId: STATUS_DEVICE_DOES_NOT_EXIST
//
// MessageText:
//
// This device does not exist.
//
  {$EXTERNALSYM STATUS_DEVICE_DOES_NOT_EXIST}
  STATUS_DEVICE_DOES_NOT_EXIST     =  TNTStatus($C00000C0);

//
// MessageId: STATUS_TOO_MANY_COMMANDS
//
// MessageText:
//
// The network BIOS command limit has been reached.
//
  {$EXTERNALSYM STATUS_TOO_MANY_COMMANDS}
  STATUS_TOO_MANY_COMMANDS         =  TNTStatus($C00000C1);

//
// MessageId: STATUS_ADAPTER_HARDWARE_ERROR
//
// MessageText:
//
// An I/O adapter hardware error has occurred.
//
  {$EXTERNALSYM STATUS_ADAPTER_HARDWARE_ERROR}
  STATUS_ADAPTER_HARDWARE_ERROR    =  TNTStatus($C00000C2);

//
// MessageId: STATUS_INVALID_NETWORK_RESPONSE
//
// MessageText:
//
// The network responded incorrectly.
//
  {$EXTERNALSYM STATUS_INVALID_NETWORK_RESPONSE}
  STATUS_INVALID_NETWORK_RESPONSE  =  TNTStatus($C00000C3);

//
// MessageId: STATUS_UNEXPECTED_NETWORK_ERROR
//
// MessageText:
//
// An unexpected network error occurred.
//
  {$EXTERNALSYM STATUS_UNEXPECTED_NETWORK_ERROR}
  STATUS_UNEXPECTED_NETWORK_ERROR  =  TNTStatus($C00000C4);

//
// MessageId: STATUS_BAD_REMOTE_ADAPTER
//
// MessageText:
//
// The remote adapter is not compatible.
//
  {$EXTERNALSYM STATUS_BAD_REMOTE_ADAPTER}
  STATUS_BAD_REMOTE_ADAPTER        =  TNTStatus($C00000C5);

//
// MessageId: STATUS_PRINT_QUEUE_FULL
//
// MessageText:
//
// The printer queue is full.
//
  {$EXTERNALSYM STATUS_PRINT_QUEUE_FULL}
  STATUS_PRINT_QUEUE_FULL          =  TNTStatus($C00000C6);

//
// MessageId: STATUS_NO_SPOOL_SPACE
//
// MessageText:
//
// Space to store the file waiting to be printed is not available on the server.
//
  {$EXTERNALSYM STATUS_NO_SPOOL_SPACE}
  STATUS_NO_SPOOL_SPACE            =  TNTStatus($C00000C7);

//
// MessageId: STATUS_PRINT_CANCELLED
//
// MessageText:
//
// The requested print file has been canceled.
//
  {$EXTERNALSYM STATUS_PRINT_CANCELLED}
  STATUS_PRINT_CANCELLED           =  TNTStatus($C00000C8);

//
// MessageId: STATUS_NETWORK_NAME_DELETED
//
// MessageText:
//
// The network name was deleted.
//
  {$EXTERNALSYM STATUS_NETWORK_NAME_DELETED}
  STATUS_NETWORK_NAME_DELETED      =  TNTStatus($C00000C9);

//
// MessageId: STATUS_NETWORK_ACCESS_DENIED
//
// MessageText:
//
// Network access is denied.
//
  {$EXTERNALSYM STATUS_NETWORK_ACCESS_DENIED}
  STATUS_NETWORK_ACCESS_DENIED     =  TNTStatus($C00000CA);

//
// MessageId: STATUS_BAD_DEVICE_TYPE
//
// MessageText:
//
// {Incorrect Network Resource Type}
// The specified device type (LPT, for example) conflicts with the actual device type on the remote resource.
//
  {$EXTERNALSYM STATUS_BAD_DEVICE_TYPE}
  STATUS_BAD_DEVICE_TYPE           =  TNTStatus($C00000CB);

//
// MessageId: STATUS_BAD_NETWORK_NAME
//
// MessageText:
//
// {Network Name Not Found}
// The specified share name cannot be found on the remote server.
//
  {$EXTERNALSYM STATUS_BAD_NETWORK_NAME}
  STATUS_BAD_NETWORK_NAME          =  TNTStatus($C00000CC);

//
// MessageId: STATUS_TOO_MANY_NAMES
//
// MessageText:
//
// The name limit for the local computer network adapter card was exceeded.
//
  {$EXTERNALSYM STATUS_TOO_MANY_NAMES}
  STATUS_TOO_MANY_NAMES            =  TNTStatus($C00000CD);

//
// MessageId: STATUS_TOO_MANY_SESSIONS
//
// MessageText:
//
// The network BIOS session limit was exceeded.
//
  {$EXTERNALSYM STATUS_TOO_MANY_SESSIONS}
  STATUS_TOO_MANY_SESSIONS         =  TNTStatus($C00000CE);

//
// MessageId: STATUS_SHARING_PAUSED
//
// MessageText:
//
// File sharing has been temporarily paused.
//
  {$EXTERNALSYM STATUS_SHARING_PAUSED}
  STATUS_SHARING_PAUSED            =  TNTStatus($C00000CF);

//
// MessageId: STATUS_REQUEST_NOT_ACCEPTED
//
// MessageText:
//
// No more connections can be made to this remote computer at this time because there are already as many connections as the computer can accept.
//
  {$EXTERNALSYM STATUS_REQUEST_NOT_ACCEPTED}
  STATUS_REQUEST_NOT_ACCEPTED      =  TNTStatus($C00000D0);

//
// MessageId: STATUS_REDIRECTOR_PAUSED
//
// MessageText:
//
// Print or disk redirection is temporarily paused.
//
  {$EXTERNALSYM STATUS_REDIRECTOR_PAUSED}
  STATUS_REDIRECTOR_PAUSED         =  TNTStatus($C00000D1);

//
// MessageId: STATUS_NET_WRITE_FAULT
//
// MessageText:
//
// A network data fault occurred.
//
  {$EXTERNALSYM STATUS_NET_WRITE_FAULT}
  STATUS_NET_WRITE_FAULT           =  TNTStatus($C00000D2);

//
// MessageId: STATUS_PROFILING_AT_LIMIT
//
// MessageText:
//
// The number of active profiling objects is at the maximum and no more may be started.
//
  {$EXTERNALSYM STATUS_PROFILING_AT_LIMIT}
  STATUS_PROFILING_AT_LIMIT        =  TNTStatus($C00000D3);

//
// MessageId: STATUS_NOT_SAME_DEVICE
//
// MessageText:
//
// {Incorrect Volume}
// The target file of a rename request is located on a different device than the source of the rename request.
//
  {$EXTERNALSYM STATUS_NOT_SAME_DEVICE}
  STATUS_NOT_SAME_DEVICE           =  TNTStatus($C00000D4);

//
// MessageId: STATUS_FILE_RENAMED
//
// MessageText:
//
// The file specified has been renamed and thus cannot be modified.
//
  {$EXTERNALSYM STATUS_FILE_RENAMED}
  STATUS_FILE_RENAMED              =  TNTStatus($C00000D5);

//
// MessageId: STATUS_VIRTUAL_CIRCUIT_CLOSED
//
// MessageText:
//
// {Network Request Timeout}
// The session with a remote server has been disconnected because the time-out interval for a request has expired.
//
  {$EXTERNALSYM STATUS_VIRTUAL_CIRCUIT_CLOSED}
  STATUS_VIRTUAL_CIRCUIT_CLOSED    =  TNTStatus($C00000D6);

//
// MessageId: STATUS_NO_SECURITY_ON_OBJECT
//
// MessageText:
//
// Indicates an attempt was made to operate on the security of an object that does not have security associated with it.
//
  {$EXTERNALSYM STATUS_NO_SECURITY_ON_OBJECT}
  STATUS_NO_SECURITY_ON_OBJECT     =  TNTStatus($C00000D7);

//
// MessageId: STATUS_CANT_WAIT
//
// MessageText:
//
// Used to indicate that an operation cannot continue without blocking for I/O.
//
  {$EXTERNALSYM STATUS_CANT_WAIT}
  STATUS_CANT_WAIT                 =  TNTStatus($C00000D8);

//
// MessageId: STATUS_PIPE_EMPTY
//
// MessageText:
//
// Used to indicate that a read operation was done on an empty pipe.
//
  {$EXTERNALSYM STATUS_PIPE_EMPTY}
  STATUS_PIPE_EMPTY                =  TNTStatus($C00000D9);

//
// MessageId: STATUS_CANT_ACCESS_DOMAIN_INFO
//
// MessageText:
//
// Configuration information could not be read from the domain controller, either because the machine is unavailable, or access has been denied.
//
  {$EXTERNALSYM STATUS_CANT_ACCESS_DOMAIN_INFO}
  STATUS_CANT_ACCESS_DOMAIN_INFO   =  TNTStatus($C00000DA);

//
// MessageId: STATUS_CANT_TERMINATE_SELF
//
// MessageText:
//
// Indicates that a thread attempted to terminate itself by default (called NtTerminateThread with NULL) and it was the last thread in the current process.
//
  {$EXTERNALSYM STATUS_CANT_TERMINATE_SELF}
  STATUS_CANT_TERMINATE_SELF       =  TNTStatus($C00000DB);

//
// MessageId: STATUS_INVALID_SERVER_STATE
//
// MessageText:
//
// Indicates the Sam Server was in the wrong state to perform the desired operation.
//
  {$EXTERNALSYM STATUS_INVALID_SERVER_STATE}
  STATUS_INVALID_SERVER_STATE      =  TNTStatus($C00000DC);

//
// MessageId: STATUS_INVALID_DOMAIN_STATE
//
// MessageText:
//
// Indicates the Domain was in the wrong state to perform the desired operation.
//
  {$EXTERNALSYM STATUS_INVALID_DOMAIN_STATE}
  STATUS_INVALID_DOMAIN_STATE      =  TNTStatus($C00000DD);

//
// MessageId: STATUS_INVALID_DOMAIN_ROLE
//
// MessageText:
//
// This operation is only allowed for the Primary Domain Controller of the domain.
//
  {$EXTERNALSYM STATUS_INVALID_DOMAIN_ROLE}
  STATUS_INVALID_DOMAIN_ROLE       =  TNTStatus($C00000DE);

//
// MessageId: STATUS_NO_SUCH_DOMAIN
//
// MessageText:
//
// The specified Domain did not exist.
//
  {$EXTERNALSYM STATUS_NO_SUCH_DOMAIN}
  STATUS_NO_SUCH_DOMAIN            =  TNTStatus($C00000DF);

//
// MessageId: STATUS_DOMAIN_EXISTS
//
// MessageText:
//
// The specified Domain already exists.
//
  {$EXTERNALSYM STATUS_DOMAIN_EXISTS}
  STATUS_DOMAIN_EXISTS             =  TNTStatus($C00000E0);

//
// MessageId: STATUS_DOMAIN_LIMIT_EXCEEDED
//
// MessageText:
//
// An attempt was made to exceed the limit on the number of domains per server for this release.
//
  {$EXTERNALSYM STATUS_DOMAIN_LIMIT_EXCEEDED}
  STATUS_DOMAIN_LIMIT_EXCEEDED     =  TNTStatus($C00000E1);

//
// MessageId: STATUS_OPLOCK_NOT_GRANTED
//
// MessageText:
//
// Error status returned when oplock request is denied.
//
  {$EXTERNALSYM STATUS_OPLOCK_NOT_GRANTED}
  STATUS_OPLOCK_NOT_GRANTED        =  TNTStatus($C00000E2);

//
// MessageId: STATUS_INVALID_OPLOCK_PROTOCOL
//
// MessageText:
//
// Error status returned when an invalid oplock acknowledgment is received by a file system.
//
  {$EXTERNALSYM STATUS_INVALID_OPLOCK_PROTOCOL}
  STATUS_INVALID_OPLOCK_PROTOCOL   =  TNTStatus($C00000E3);

//
// MessageId: STATUS_INTERNAL_DB_CORRUPTION
//
// MessageText:
//
// This error indicates that the requested operation cannot be completed due to a catastrophic media failure or on-disk data structure corruption.
//
  {$EXTERNALSYM STATUS_INTERNAL_DB_CORRUPTION}
  STATUS_INTERNAL_DB_CORRUPTION    =  TNTStatus($C00000E4);

//
// MessageId: STATUS_INTERNAL_ERROR
//
// MessageText:
//
// An internal error occurred.
//
  {$EXTERNALSYM STATUS_INTERNAL_ERROR}
  STATUS_INTERNAL_ERROR            =  TNTStatus($C00000E5);

//
// MessageId: STATUS_GENERIC_NOT_MAPPED
//
// MessageText:
//
// Indicates generic access types were contained in an access mask which should already be mapped to non-generic access types.
//
  {$EXTERNALSYM STATUS_GENERIC_NOT_MAPPED}
  STATUS_GENERIC_NOT_MAPPED        =  TNTStatus($C00000E6);

//
// MessageId: STATUS_BAD_DESCRIPTOR_FORMAT
//
// MessageText:
//
// Indicates a security descriptor is not in the necessary format (absolute or self-relative).
//
  {$EXTERNALSYM STATUS_BAD_DESCRIPTOR_FORMAT}
  STATUS_BAD_DESCRIPTOR_FORMAT     =  TNTStatus($C00000E7);

//
// Status codes raised by the Cache Manager which must be considered as
// "expected" by its callers.
//
//
// MessageId: STATUS_INVALID_USER_BUFFER
//
// MessageText:
//
// An access to a user buffer failed at an "expected" point in time.
// This code is defined since the caller does not want to accept STATUS_ACCESS_VIOLATION in its filter.
//
  {$EXTERNALSYM STATUS_INVALID_USER_BUFFER}
  STATUS_INVALID_USER_BUFFER       =  TNTStatus($C00000E8);

//
// MessageId: STATUS_UNEXPECTED_IO_ERROR
//
// MessageText:
//
// If an I/O error is returned which is not defined in the standard FsRtl filter, it is converted to the following error which is guaranteed to be in the filter.
// In this case information is lost, however, the filter correctly handles the exception.
//
  {$EXTERNALSYM STATUS_UNEXPECTED_IO_ERROR}
  STATUS_UNEXPECTED_IO_ERROR       =  TNTStatus($C00000E9);

//
// MessageId: STATUS_UNEXPECTED_MM_CREATE_ERR
//
// MessageText:
//
// If an MM error is returned which is not defined in the standard FsRtl filter, it is converted to one of the following errors which is guaranteed to be in the filter.
// In this case information is lost, however, the filter correctly handles the exception.
//
  {$EXTERNALSYM STATUS_UNEXPECTED_MM_CREATE_ERR}
  STATUS_UNEXPECTED_MM_CREATE_ERR  =  TNTStatus($C00000EA);

//
// MessageId: STATUS_UNEXPECTED_MM_MAP_ERROR
//
// MessageText:
//
// If an MM error is returned which is not defined in the standard FsRtl filter, it is converted to one of the following errors which is guaranteed to be in the filter.
// In this case information is lost, however, the filter correctly handles the exception.
//
  {$EXTERNALSYM STATUS_UNEXPECTED_MM_MAP_ERROR}
  STATUS_UNEXPECTED_MM_MAP_ERROR   =  TNTStatus($C00000EB);

//
// MessageId: STATUS_UNEXPECTED_MM_EXTEND_ERR
//
// MessageText:
//
// If an MM error is returned which is not defined in the standard FsRtl filter, it is converted to one of the following errors which is guaranteed to be in the filter.
// In this case information is lost, however, the filter correctly handles the exception.
//
  {$EXTERNALSYM STATUS_UNEXPECTED_MM_EXTEND_ERR}
  STATUS_UNEXPECTED_MM_EXTEND_ERR  =  TNTStatus($C00000EC);

//
// MessageId: STATUS_NOT_LOGON_PROCESS
//
// MessageText:
//
// The requested action is restricted for use by logon processes only. The calling process has not registered as a logon process.
//
  {$EXTERNALSYM STATUS_NOT_LOGON_PROCESS}
  STATUS_NOT_LOGON_PROCESS         =  TNTStatus($C00000ED);

//
// MessageId: STATUS_LOGON_SESSION_EXISTS
//
// MessageText:
//
// An attempt has been made to start a new session manager or LSA logon session with an ID that is already in use.
//
  {$EXTERNALSYM STATUS_LOGON_SESSION_EXISTS}
  STATUS_LOGON_SESSION_EXISTS      =  TNTStatus($C00000EE);

//
// MessageId: STATUS_INVALID_PARAMETER_1
//
// MessageText:
//
// An invalid parameter was passed to a service or function as the first argument.
//
  {$EXTERNALSYM STATUS_INVALID_PARAMETER_1}
  STATUS_INVALID_PARAMETER_1       =  TNTStatus($C00000EF);

//
// MessageId: STATUS_INVALID_PARAMETER_2
//
// MessageText:
//
// An invalid parameter was passed to a service or function as the second argument.
//
  {$EXTERNALSYM STATUS_INVALID_PARAMETER_2}
  STATUS_INVALID_PARAMETER_2       =  TNTStatus($C00000F0);

//
// MessageId: STATUS_INVALID_PARAMETER_3
//
// MessageText:
//
// An invalid parameter was passed to a service or function as the third argument.
//
  {$EXTERNALSYM STATUS_INVALID_PARAMETER_3}
  STATUS_INVALID_PARAMETER_3       =  TNTStatus($C00000F1);

//
// MessageId: STATUS_INVALID_PARAMETER_4
//
// MessageText:
//
// An invalid parameter was passed to a service or function as the fourth argument.
//
  {$EXTERNALSYM STATUS_INVALID_PARAMETER_4}
  STATUS_INVALID_PARAMETER_4       =  TNTStatus($C00000F2);

//
// MessageId: STATUS_INVALID_PARAMETER_5
//
// MessageText:
//
// An invalid parameter was passed to a service or function as the fifth argument.
//
  {$EXTERNALSYM STATUS_INVALID_PARAMETER_5}
  STATUS_INVALID_PARAMETER_5       =  TNTStatus($C00000F3);

//
// MessageId: STATUS_INVALID_PARAMETER_6
//
// MessageText:
//
// An invalid parameter was passed to a service or function as the sixth argument.
//
  {$EXTERNALSYM STATUS_INVALID_PARAMETER_6}
  STATUS_INVALID_PARAMETER_6       =  TNTStatus($C00000F4);

//
// MessageId: STATUS_INVALID_PARAMETER_7
//
// MessageText:
//
// An invalid parameter was passed to a service or function as the seventh argument.
//
  {$EXTERNALSYM STATUS_INVALID_PARAMETER_7}
  STATUS_INVALID_PARAMETER_7       =  TNTStatus($C00000F5);

//
// MessageId: STATUS_INVALID_PARAMETER_8
//
// MessageText:
//
// An invalid parameter was passed to a service or function as the eighth argument.
//
  {$EXTERNALSYM STATUS_INVALID_PARAMETER_8}
  STATUS_INVALID_PARAMETER_8       =  TNTStatus($C00000F6);

//
// MessageId: STATUS_INVALID_PARAMETER_9
//
// MessageText:
//
// An invalid parameter was passed to a service or function as the ninth argument.
//
  {$EXTERNALSYM STATUS_INVALID_PARAMETER_9}
  STATUS_INVALID_PARAMETER_9       =  TNTStatus($C00000F7);

//
// MessageId: STATUS_INVALID_PARAMETER_10
//
// MessageText:
//
// An invalid parameter was passed to a service or function as the tenth argument.
//
  {$EXTERNALSYM STATUS_INVALID_PARAMETER_10}
  STATUS_INVALID_PARAMETER_10      =  TNTStatus($C00000F8);

//
// MessageId: STATUS_INVALID_PARAMETER_11
//
// MessageText:
//
// An invalid parameter was passed to a service or function as the eleventh argument.
//
  {$EXTERNALSYM STATUS_INVALID_PARAMETER_11}
  STATUS_INVALID_PARAMETER_11      =  TNTStatus($C00000F9);

//
// MessageId: STATUS_INVALID_PARAMETER_12
//
// MessageText:
//
// An invalid parameter was passed to a service or function as the twelfth argument.
//
  {$EXTERNALSYM STATUS_INVALID_PARAMETER_12}
  STATUS_INVALID_PARAMETER_12      =  TNTStatus($C00000FA);

//
// MessageId: STATUS_REDIRECTOR_NOT_STARTED
//
// MessageText:
//
// An attempt was made to access a network file, but the network software was not yet started.
//
  {$EXTERNALSYM STATUS_REDIRECTOR_NOT_STARTED}
  STATUS_REDIRECTOR_NOT_STARTED    =  TNTStatus($C00000FB);

//
// MessageId: STATUS_REDIRECTOR_STARTED
//
// MessageText:
//
// An attempt was made to start the redirector, but the redirector has already been started.
//
  {$EXTERNALSYM STATUS_REDIRECTOR_STARTED}
  STATUS_REDIRECTOR_STARTED        =  TNTStatus($C00000FC);

//
// MessageId: STATUS_STACK_OVERFLOW
//
// MessageText:
//
// A new guard page for the stack cannot be created.
//
  {$EXTERNALSYM STATUS_STACK_OVERFLOW}
  STATUS_STACK_OVERFLOW            =  TNTStatus($C00000FD);    // winnt

//
// MessageId: STATUS_NO_SUCH_PACKAGE
//
// MessageText:
//
// A specified authentication package is unknown.
//
  {$EXTERNALSYM STATUS_NO_SUCH_PACKAGE}
  STATUS_NO_SUCH_PACKAGE           =  TNTStatus($C00000FE);

//
// MessageId: STATUS_BAD_FUNCTION_TABLE
//
// MessageText:
//
// A malformed function table was encountered during an unwind operation.
//
  {$EXTERNALSYM STATUS_BAD_FUNCTION_TABLE}
  STATUS_BAD_FUNCTION_TABLE        =  TNTStatus($C00000FF);

//
// MessageId: STATUS_VARIABLE_NOT_FOUND
//
// MessageText:
//
// Indicates the specified environment variable name was not found in the specified environment block.
//
  {$EXTERNALSYM STATUS_VARIABLE_NOT_FOUND}
  STATUS_VARIABLE_NOT_FOUND        =  TNTStatus($C0000100);

//
// MessageId: STATUS_DIRECTORY_NOT_EMPTY
//
// MessageText:
//
// Indicates that the directory trying to be deleted is not empty.
//
  {$EXTERNALSYM STATUS_DIRECTORY_NOT_EMPTY}
  STATUS_DIRECTORY_NOT_EMPTY       =  TNTStatus($C0000101);

//
// MessageId: STATUS_FILE_CORRUPT_ERROR
//
// MessageText:
//
// {Corrupt File}
// The file or directory %hs is corrupt and unreadable.
// Please run the Chkdsk utility.
//
  {$EXTERNALSYM STATUS_FILE_CORRUPT_ERROR}
  STATUS_FILE_CORRUPT_ERROR        =  TNTStatus($C0000102);

//
// MessageId: STATUS_NOT_A_DIRECTORY
//
// MessageText:
//
// A requested opened file is not a directory.
//
  {$EXTERNALSYM STATUS_NOT_A_DIRECTORY}
  STATUS_NOT_A_DIRECTORY           =  TNTStatus($C0000103);

//
// MessageId: STATUS_BAD_LOGON_SESSION_STATE
//
// MessageText:
//
// The logon session is not in a state that is consistent with the requested operation.
//
  {$EXTERNALSYM STATUS_BAD_LOGON_SESSION_STATE}
  STATUS_BAD_LOGON_SESSION_STATE   =  TNTStatus($C0000104);

//
// MessageId: STATUS_LOGON_SESSION_COLLISION
//
// MessageText:
//
// An internal LSA error has occurred. An authentication package has requested the creation of a Logon Session but the ID of an already existing Logon Session has been specified.
//
  {$EXTERNALSYM STATUS_LOGON_SESSION_COLLISION}
  STATUS_LOGON_SESSION_COLLISION   =  TNTStatus($C0000105);

//
// MessageId: STATUS_NAME_TOO_LONG
//
// MessageText:
//
// A specified name string is too long for its intended use.
//
  {$EXTERNALSYM STATUS_NAME_TOO_LONG}
  STATUS_NAME_TOO_LONG             =  TNTStatus($C0000106);

//
// MessageId: STATUS_FILES_OPEN
//
// MessageText:
//
// The user attempted to force close the files on a redirected drive, but there were opened files on the drive, and the user did not specify a sufficient level of force.
//
  {$EXTERNALSYM STATUS_FILES_OPEN}
  STATUS_FILES_OPEN                =  TNTStatus($C0000107);

//
// MessageId: STATUS_CONNECTION_IN_USE
//
// MessageText:
//
// The user attempted to force close the files on a redirected drive, but there were opened directories on the drive, and the user did not specify a sufficient level of force.
//
  {$EXTERNALSYM STATUS_CONNECTION_IN_USE}
  STATUS_CONNECTION_IN_USE         =  TNTStatus($C0000108);

//
// MessageId: STATUS_MESSAGE_NOT_FOUND
//
// MessageText:
//
// RtlFindMessage could not locate the requested message ID in the message table resource.
//
  {$EXTERNALSYM STATUS_MESSAGE_NOT_FOUND}
  STATUS_MESSAGE_NOT_FOUND         =  TNTStatus($C0000109);

//
// MessageId: STATUS_PROCESS_IS_TERMINATING
//
// MessageText:
//
// An attempt was made to access an exiting process.
//
  {$EXTERNALSYM STATUS_PROCESS_IS_TERMINATING}
  STATUS_PROCESS_IS_TERMINATING    =  TNTStatus($C000010A);

//
// MessageId: STATUS_INVALID_LOGON_TYPE
//
// MessageText:
//
// Indicates an invalid value has been provided for the LogonType requested.
//
  {$EXTERNALSYM STATUS_INVALID_LOGON_TYPE}
  STATUS_INVALID_LOGON_TYPE        =  TNTStatus($C000010B);

//
// MessageId: STATUS_NO_GUID_TRANSLATION
//
// MessageText:
//
// Indicates that an attempt was made to assign protection to a file system file or directory and one of the SIDs in the security descriptor could not be translated into a GUID that could be stored by the file system.
// This causes the protection attempt to fail, which may cause a file creation attempt to fail.
//
  {$EXTERNALSYM STATUS_NO_GUID_TRANSLATION}
  STATUS_NO_GUID_TRANSLATION       =  TNTStatus($C000010C);

//
// MessageId: STATUS_CANNOT_IMPERSONATE
//
// MessageText:
//
// Indicates that an attempt has been made to impersonate via a named pipe that has not yet been read from.
//
  {$EXTERNALSYM STATUS_CANNOT_IMPERSONATE}
  STATUS_CANNOT_IMPERSONATE        =  TNTStatus($C000010D);

//
// MessageId: STATUS_IMAGE_ALREADY_LOADED
//
// MessageText:
//
// Indicates that the specified image is already loaded.
//
  {$EXTERNALSYM STATUS_IMAGE_ALREADY_LOADED}
  STATUS_IMAGE_ALREADY_LOADED      =  TNTStatus($C000010E);


//
// ============================================================
// NOTE: The following ABIOS error code should be reserved on
//       non ABIOS kernel. Eventually, I will remove the ifdef
//       ABIOS.
// ============================================================
//
//
// MessageId: STATUS_ABIOS_NOT_PRESENT
//
// MessageText:
//
//  STATUS_ABIOS_NOT_PRESENT
//
  {$EXTERNALSYM STATUS_ABIOS_NOT_PRESENT}
  STATUS_ABIOS_NOT_PRESENT         =  TNTStatus($C000010F);

//
// MessageId: STATUS_ABIOS_LID_NOT_EXIST
//
// MessageText:
//
//  STATUS_ABIOS_LID_NOT_EXIST
//
  {$EXTERNALSYM STATUS_ABIOS_LID_NOT_EXIST}
  STATUS_ABIOS_LID_NOT_EXIST       =  TNTStatus($C0000110);

//
// MessageId: STATUS_ABIOS_LID_ALREADY_OWNED
//
// MessageText:
//
//  STATUS_ABIOS_LID_ALREADY_OWNED
//
  {$EXTERNALSYM STATUS_ABIOS_LID_ALREADY_OWNED}
  STATUS_ABIOS_LID_ALREADY_OWNED   =  TNTStatus($C0000111);

//
// MessageId: STATUS_ABIOS_NOT_LID_OWNER
//
// MessageText:
//
//  STATUS_ABIOS_NOT_LID_OWNER
//
  {$EXTERNALSYM STATUS_ABIOS_NOT_LID_OWNER}
  STATUS_ABIOS_NOT_LID_OWNER       =  TNTStatus($C0000112);

//
// MessageId: STATUS_ABIOS_INVALID_COMMAND
//
// MessageText:
//
//  STATUS_ABIOS_INVALID_COMMAND
//
  {$EXTERNALSYM STATUS_ABIOS_INVALID_COMMAND}
  STATUS_ABIOS_INVALID_COMMAND     =  TNTStatus($C0000113);

//
// MessageId: STATUS_ABIOS_INVALID_LID
//
// MessageText:
//
//  STATUS_ABIOS_INVALID_LID
//
  {$EXTERNALSYM STATUS_ABIOS_INVALID_LID}
  STATUS_ABIOS_INVALID_LID         =  TNTStatus($C0000114);

//
// MessageId: STATUS_ABIOS_SELECTOR_NOT_AVAILABLE
//
// MessageText:
//
//  STATUS_ABIOS_SELECTOR_NOT_AVAILABLE
//
  {$EXTERNALSYM STATUS_ABIOS_SELECTOR_NOT_AVAILABLE}
  STATUS_ABIOS_SELECTOR_NOT_AVAILABLE =  TNTStatus($C0000115);

//
// MessageId: STATUS_ABIOS_INVALID_SELECTOR
//
// MessageText:
//
//  STATUS_ABIOS_INVALID_SELECTOR
//
  {$EXTERNALSYM STATUS_ABIOS_INVALID_SELECTOR}
  STATUS_ABIOS_INVALID_SELECTOR    =  TNTStatus($C0000116);

//
// MessageId: STATUS_NO_LDT
//
// MessageText:
//
// Indicates that an attempt was made to change the size of the LDT for a process that has no LDT.
//
  {$EXTERNALSYM STATUS_NO_LDT}
  STATUS_NO_LDT                    =  TNTStatus($C0000117);

//
// MessageId: STATUS_INVALID_LDT_SIZE
//
// MessageText:
//
// Indicates that an attempt was made to grow an LDT by setting its size, or that the size was not an even number of selectors.
//
  {$EXTERNALSYM STATUS_INVALID_LDT_SIZE}
  STATUS_INVALID_LDT_SIZE          =  TNTStatus($C0000118);

//
// MessageId: STATUS_INVALID_LDT_OFFSET
//
// MessageText:
//
// Indicates that the starting value for the LDT information was not an integral multiple of the selector size.
//
  {$EXTERNALSYM STATUS_INVALID_LDT_OFFSET}
  STATUS_INVALID_LDT_OFFSET        =  TNTStatus($C0000119);

//
// MessageId: STATUS_INVALID_LDT_DESCRIPTOR
//
// MessageText:
//
// Indicates that the user supplied an invalid descriptor when trying to set up Ldt descriptors.
//
  {$EXTERNALSYM STATUS_INVALID_LDT_DESCRIPTOR}
  STATUS_INVALID_LDT_DESCRIPTOR    =  TNTStatus($C000011A);

//
// MessageId: STATUS_INVALID_IMAGE_NE_FORMAT
//
// MessageText:
//
// The specified image file did not have the correct format. It appears to be NE format.
//
  {$EXTERNALSYM STATUS_INVALID_IMAGE_NE_FORMAT}
  STATUS_INVALID_IMAGE_NE_FORMAT   =  TNTStatus($C000011B);

//
// MessageId: STATUS_RXACT_INVALID_STATE
//
// MessageText:
//
// Indicates that the transaction state of a registry sub-tree is incompatible with the requested operation.
// For example, a request has been made to start a new transaction with one already in progress,
// or a request has been made to apply a transaction when one is not currently in progress.
//
  {$EXTERNALSYM STATUS_RXACT_INVALID_STATE}
  STATUS_RXACT_INVALID_STATE       =  TNTStatus($C000011C);

//
// MessageId: STATUS_RXACT_COMMIT_FAILURE
//
// MessageText:
//
// Indicates an error has occurred during a registry transaction commit.
// The database has been left in an unknown, but probably inconsistent, state.
// The state of the registry transaction is left as COMMITTING.
//
  {$EXTERNALSYM STATUS_RXACT_COMMIT_FAILURE}
  STATUS_RXACT_COMMIT_FAILURE      =  TNTStatus($C000011D);

//
// MessageId: STATUS_MAPPED_FILE_SIZE_ZERO
//
// MessageText:
//
// An attempt was made to map a file of size zero with the maximum size specified as zero.
//
  {$EXTERNALSYM STATUS_MAPPED_FILE_SIZE_ZERO}
  STATUS_MAPPED_FILE_SIZE_ZERO     =  TNTStatus($C000011E);

//
// MessageId: STATUS_TOO_MANY_OPENED_FILES
//
// MessageText:
//
// Too many files are opened on a remote server.
// This error should only be returned by the Windows redirector on a remote drive.
//
  {$EXTERNALSYM STATUS_TOO_MANY_OPENED_FILES}
  STATUS_TOO_MANY_OPENED_FILES     =  TNTStatus($C000011F);

//
// MessageId: STATUS_CANCELLED
//
// MessageText:
//
// The I/O request was canceled.
//
  {$EXTERNALSYM STATUS_CANCELLED}
  STATUS_CANCELLED                 =  TNTStatus($C0000120);

//
// MessageId: STATUS_CANNOT_DELETE
//
// MessageText:
//
// An attempt has been made to remove a file or directory that cannot be deleted.
//
  {$EXTERNALSYM STATUS_CANNOT_DELETE}
  STATUS_CANNOT_DELETE             =  TNTStatus($C0000121);

//
// MessageId: STATUS_INVALID_COMPUTER_NAME
//
// MessageText:
//
// Indicates a name specified as a remote computer name is syntactically invalid.
//
  {$EXTERNALSYM STATUS_INVALID_COMPUTER_NAME}
  STATUS_INVALID_COMPUTER_NAME     =  TNTStatus($C0000122);

//
// MessageId: STATUS_FILE_DELETED
//
// MessageText:
//
// An I/O request other than close was performed on a file after it has been deleted,
// which can only happen to a request which did not complete before the last handle was closed via NtClose.
//
  {$EXTERNALSYM STATUS_FILE_DELETED}
  STATUS_FILE_DELETED              =  TNTStatus($C0000123);

//
// MessageId: STATUS_SPECIAL_ACCOUNT
//
// MessageText:
//
// Indicates an operation has been attempted on a built-in (special) SAM account which is incompatible with built-in accounts.
// For example, built-in accounts cannot be deleted.
//
  {$EXTERNALSYM STATUS_SPECIAL_ACCOUNT}
  STATUS_SPECIAL_ACCOUNT           =  TNTStatus($C0000124);

//
// MessageId: STATUS_SPECIAL_GROUP
//
// MessageText:
//
// The operation requested may not be performed on the specified group because it is a built-in special group.
//
  {$EXTERNALSYM STATUS_SPECIAL_GROUP}
  STATUS_SPECIAL_GROUP             =  TNTStatus($C0000125);

//
// MessageId: STATUS_SPECIAL_USER
//
// MessageText:
//
// The operation requested may not be performed on the specified user because it is a built-in special user.
//
  {$EXTERNALSYM STATUS_SPECIAL_USER}
  STATUS_SPECIAL_USER              =  TNTStatus($C0000126);

//
// MessageId: STATUS_MEMBERS_PRIMARY_GROUP
//
// MessageText:
//
// Indicates a member cannot be removed from a group because the group is currently the member's primary group.
//
  {$EXTERNALSYM STATUS_MEMBERS_PRIMARY_GROUP}
  STATUS_MEMBERS_PRIMARY_GROUP     =  TNTStatus($C0000127);

//
// MessageId: STATUS_FILE_CLOSED
//
// MessageText:
//
// An I/O request other than close and several other special case operations was attempted using a file object that had already been closed.
//
  {$EXTERNALSYM STATUS_FILE_CLOSED}
  STATUS_FILE_CLOSED               =  TNTStatus($C0000128);

//
// MessageId: STATUS_TOO_MANY_THREADS
//
// MessageText:
//
// Indicates a process has too many threads to perform the requested action. For example, assignment of a primary token may only be performed when a process has zero or one threads.
//
  {$EXTERNALSYM STATUS_TOO_MANY_THREADS}
  STATUS_TOO_MANY_THREADS          =  TNTStatus($C0000129);

//
// MessageId: STATUS_THREAD_NOT_IN_PROCESS
//
// MessageText:
//
// An attempt was made to operate on a thread within a specific process, but the thread specified is not in the process specified.
//
  {$EXTERNALSYM STATUS_THREAD_NOT_IN_PROCESS}
  STATUS_THREAD_NOT_IN_PROCESS     =  TNTStatus($C000012A);

//
// MessageId: STATUS_TOKEN_ALREADY_IN_USE
//
// MessageText:
//
// An attempt was made to establish a token for use as a primary token but the token is already in use. A token can only be the primary token of one process at a time.
//
  {$EXTERNALSYM STATUS_TOKEN_ALREADY_IN_USE}
  STATUS_TOKEN_ALREADY_IN_USE      =  TNTStatus($C000012B);

//
// MessageId: STATUS_PAGEFILE_QUOTA_EXCEEDED
//
// MessageText:
//
// Page file quota was exceeded.
//
  {$EXTERNALSYM STATUS_PAGEFILE_QUOTA_EXCEEDED}
  STATUS_PAGEFILE_QUOTA_EXCEEDED   =  TNTStatus($C000012C);

//
// MessageId: STATUS_COMMITMENT_LIMIT
//
// MessageText:
//
// {Out of Virtual Memory}
// Your system is low on virtual memory. To ensure that Windows runs properly, increase the size of your virtual memory paging file. For more information, see Help.
//
  {$EXTERNALSYM STATUS_COMMITMENT_LIMIT}
  STATUS_COMMITMENT_LIMIT          =  TNTStatus($C000012D);

//
// MessageId: STATUS_INVALID_IMAGE_LE_FORMAT
//
// MessageText:
//
// The specified image file did not have the correct format, it appears to be LE format.
//
  {$EXTERNALSYM STATUS_INVALID_IMAGE_LE_FORMAT}
  STATUS_INVALID_IMAGE_LE_FORMAT   =  TNTStatus($C000012E);

//
// MessageId: STATUS_INVALID_IMAGE_NOT_MZ
//
// MessageText:
//
// The specified image file did not have the correct format, it did not have an initial MZ.
//
  {$EXTERNALSYM STATUS_INVALID_IMAGE_NOT_MZ}
  STATUS_INVALID_IMAGE_NOT_MZ      =  TNTStatus($C000012F);

//
// MessageId: STATUS_INVALID_IMAGE_PROTECT
//
// MessageText:
//
// The specified image file did not have the correct format, it did not have a proper e_lfarlc in the MZ header.
//
  {$EXTERNALSYM STATUS_INVALID_IMAGE_PROTECT}
  STATUS_INVALID_IMAGE_PROTECT     =  TNTStatus($C0000130);

//
// MessageId: STATUS_INVALID_IMAGE_WIN_16
//
// MessageText:
//
// The specified image file did not have the correct format, it appears to be a 16-bit Windows image.
//
  {$EXTERNALSYM STATUS_INVALID_IMAGE_WIN_16}
  STATUS_INVALID_IMAGE_WIN_16      =  TNTStatus($C0000131);

//
// MessageId: STATUS_LOGON_SERVER_CONFLICT
//
// MessageText:
//
// The Netlogon service cannot start because another Netlogon service running in the domain conflicts with the specified role.
//
  {$EXTERNALSYM STATUS_LOGON_SERVER_CONFLICT}
  STATUS_LOGON_SERVER_CONFLICT     =  TNTStatus($C0000132);

//
// MessageId: STATUS_TIME_DIFFERENCE_AT_DC
//
// MessageText:
//
// The time at the Primary Domain Controller is different than the time at the Backup Domain Controller or member server by too large an amount.
//
  {$EXTERNALSYM STATUS_TIME_DIFFERENCE_AT_DC}
  STATUS_TIME_DIFFERENCE_AT_DC     =  TNTStatus($C0000133);

//
// MessageId: STATUS_SYNCHRONIZATION_REQUIRED
//
// MessageText:
//
// The SAM database on a Windows Server is significantly out of synchronization with the copy on the Domain Controller. A complete synchronization is required.
//
  {$EXTERNALSYM STATUS_SYNCHRONIZATION_REQUIRED}
  STATUS_SYNCHRONIZATION_REQUIRED  =  TNTStatus($C0000134);

//
// MessageId: STATUS_DLL_NOT_FOUND
//
// MessageText:
//
// {Unable To Locate Component}
// This application has failed to start because %hs was not found. Re-installing the application may fix this problem.
//
  {$EXTERNALSYM STATUS_DLL_NOT_FOUND}
  STATUS_DLL_NOT_FOUND             =  TNTStatus($C0000135);

//
// MessageId: STATUS_OPEN_FAILED
//
// MessageText:
//
// The NtCreateFile API failed. This error should never be returned to an application, it is a place holder for the Windows Lan Manager Redirector to use in its internal error mapping routines.
//
  {$EXTERNALSYM STATUS_OPEN_FAILED}
  STATUS_OPEN_FAILED               =  TNTStatus($C0000136);

//
// MessageId: STATUS_IO_PRIVILEGE_FAILED
//
// MessageText:
//
// {Privilege Failed}
// The I/O permissions for the process could not be changed.
//
  {$EXTERNALSYM STATUS_IO_PRIVILEGE_FAILED}
  STATUS_IO_PRIVILEGE_FAILED       =  TNTStatus($C0000137);

//
// MessageId: STATUS_ORDINAL_NOT_FOUND
//
// MessageText:
//
// {Ordinal Not Found}
// The ordinal %ld could not be located in the dynamic link library %hs.
//
  {$EXTERNALSYM STATUS_ORDINAL_NOT_FOUND}
  STATUS_ORDINAL_NOT_FOUND         =  TNTStatus($C0000138);

//
// MessageId: STATUS_ENTRYPOINT_NOT_FOUND
//
// MessageText:
//
// {Entry Point Not Found}
// The procedure entry point %hs could not be located in the dynamic link library %hs.
//
  {$EXTERNALSYM STATUS_ENTRYPOINT_NOT_FOUND}
  STATUS_ENTRYPOINT_NOT_FOUND      =  TNTStatus($C0000139);

//
// MessageId: STATUS_CONTROL_C_EXIT
//
// MessageText:
//
// {Application Exit by CTRL+C}
// The application terminated as a result of a CTRL+C.
//
  {$EXTERNALSYM STATUS_CONTROL_C_EXIT}
  STATUS_CONTROL_C_EXIT            =  TNTStatus($C000013A);    // winnt

//
// MessageId: STATUS_LOCAL_DISCONNECT
//
// MessageText:
//
// {Virtual Circuit Closed}
// The network transport on your computer has closed a network connection. There may or may not be I/O requests outstanding.
//
  {$EXTERNALSYM STATUS_LOCAL_DISCONNECT}
  STATUS_LOCAL_DISCONNECT          =  TNTStatus($C000013B);

//
// MessageId: STATUS_REMOTE_DISCONNECT
//
// MessageText:
//
// {Virtual Circuit Closed}
// The network transport on a remote computer has closed a network connection. There may or may not be I/O requests outstanding.
//
  {$EXTERNALSYM STATUS_REMOTE_DISCONNECT}
  STATUS_REMOTE_DISCONNECT         =  TNTStatus($C000013C);

//
// MessageId: STATUS_REMOTE_RESOURCES
//
// MessageText:
//
// {Insufficient Resources on Remote Computer}
// The remote computer has insufficient resources to complete the network request. For instance, there may not be enough memory available on the remote computer to carry out the request at this time.
//
  {$EXTERNALSYM STATUS_REMOTE_RESOURCES}
  STATUS_REMOTE_RESOURCES          =  TNTStatus($C000013D);

//
// MessageId: STATUS_LINK_FAILED
//
// MessageText:
//
// {Virtual Circuit Closed}
// An existing connection (virtual circuit) has been broken at the remote computer. There is probably something wrong with the network software protocol or the network hardware on the remote computer.
//
  {$EXTERNALSYM STATUS_LINK_FAILED}
  STATUS_LINK_FAILED               =  TNTStatus($C000013E);

//
// MessageId: STATUS_LINK_TIMEOUT
//
// MessageText:
//
// {Virtual Circuit Closed}
// The network transport on your computer has closed a network connection because it had to wait too long for a response from the remote computer.
//
  {$EXTERNALSYM STATUS_LINK_TIMEOUT}
  STATUS_LINK_TIMEOUT              =  TNTStatus($C000013F);

//
// MessageId: STATUS_INVALID_CONNECTION
//
// MessageText:
//
// The connection handle given to the transport was invalid.
//
  {$EXTERNALSYM STATUS_INVALID_CONNECTION}
  STATUS_INVALID_CONNECTION        =  TNTStatus($C0000140);

//
// MessageId: STATUS_INVALID_ADDRESS
//
// MessageText:
//
// The address handle given to the transport was invalid.
//
  {$EXTERNALSYM STATUS_INVALID_ADDRESS}
  STATUS_INVALID_ADDRESS           =  TNTStatus($C0000141);

//
// MessageId: STATUS_DLL_INIT_FAILED
//
// MessageText:
//
// {DLL Initialization Failed}
// Initialization of the dynamic link library %hs failed. The process is terminating abnormally.
//
  {$EXTERNALSYM STATUS_DLL_INIT_FAILED}
  STATUS_DLL_INIT_FAILED           =  TNTStatus($C0000142);

//
// MessageId: STATUS_MISSING_SYSTEMFILE
//
// MessageText:
//
// {Missing System File}
// The required system file %hs is bad or missing.
//
  {$EXTERNALSYM STATUS_MISSING_SYSTEMFILE}
  STATUS_MISSING_SYSTEMFILE        =  TNTStatus($C0000143);

//
// MessageId: STATUS_UNHANDLED_EXCEPTION
//
// MessageText:
//
// {Application Error}
// The exception %s (0x%08lx) occurred in the application at location 0x%08lx.
//
  {$EXTERNALSYM STATUS_UNHANDLED_EXCEPTION}
  STATUS_UNHANDLED_EXCEPTION       =  TNTStatus($C0000144);

//
// MessageId: STATUS_APP_INIT_FAILURE
//
// MessageText:
//
// {Application Error}
// The application failed to initialize properly (0x%lx). Click OK to terminate the application.
//
  {$EXTERNALSYM STATUS_APP_INIT_FAILURE}
  STATUS_APP_INIT_FAILURE          =  TNTStatus($C0000145);

//
// MessageId: STATUS_PAGEFILE_CREATE_FAILED
//
// MessageText:
//
// {Unable to Create Paging File}
// The creation of the paging file %hs failed (%lx). The requested size was %ld.
//
  {$EXTERNALSYM STATUS_PAGEFILE_CREATE_FAILED}
  STATUS_PAGEFILE_CREATE_FAILED    =  TNTStatus($C0000146);

//
// MessageId: STATUS_NO_PAGEFILE
//
// MessageText:
//
// {No Paging File Specified}
// No paging file was specified in the system configuration.
//
  {$EXTERNALSYM STATUS_NO_PAGEFILE}
  STATUS_NO_PAGEFILE               =  TNTStatus($C0000147);

//
// MessageId: STATUS_INVALID_LEVEL
//
// MessageText:
//
// {Incorrect System Call Level}
// An invalid level was passed into the specified system call.
//
  {$EXTERNALSYM STATUS_INVALID_LEVEL}
  STATUS_INVALID_LEVEL             =  TNTStatus($C0000148);

//
// MessageId: STATUS_WRONG_PASSWORD_CORE
//
// MessageText:
//
// {Incorrect Password to LAN Manager Server}
// You specified an incorrect password to a LAN Manager 2.x or MS-NET server.
//
  {$EXTERNALSYM STATUS_WRONG_PASSWORD_CORE}
  STATUS_WRONG_PASSWORD_CORE       =  TNTStatus($C0000149);

//
// MessageId: STATUS_ILLEGAL_FLOAT_CONTEXT
//
// MessageText:
//
// {EXCEPTION}
// A real-mode application issued a floating-point instruction and floating-point hardware is not present.
//
  {$EXTERNALSYM STATUS_ILLEGAL_FLOAT_CONTEXT}
  STATUS_ILLEGAL_FLOAT_CONTEXT     =  TNTStatus($C000014A);

//
// MessageId: STATUS_PIPE_BROKEN
//
// MessageText:
//
// The pipe operation has failed because the other end of the pipe has been closed.
//
  {$EXTERNALSYM STATUS_PIPE_BROKEN}
  STATUS_PIPE_BROKEN               =  TNTStatus($C000014B);

//
// MessageId: STATUS_REGISTRY_CORRUPT
//
// MessageText:
//
// {The Registry Is Corrupt}
// The structure of one of the files that contains Registry data is corrupt, or the image of the file in memory is corrupt, or the file could not be recovered because the alternate copy or log was absent or corrupt.
//
  {$EXTERNALSYM STATUS_REGISTRY_CORRUPT}
  STATUS_REGISTRY_CORRUPT          =  TNTStatus($C000014C);

//
// MessageId: STATUS_REGISTRY_IO_FAILED
//
// MessageText:
//
// An I/O operation initiated by the Registry failed unrecoverably.
// The Registry could not read in, or write out, or flush, one of the files that contain the system's image of the Registry.
//
  {$EXTERNALSYM STATUS_REGISTRY_IO_FAILED}
  STATUS_REGISTRY_IO_FAILED        =  TNTStatus($C000014D);

//
// MessageId: STATUS_NO_EVENT_PAIR
//
// MessageText:
//
// An event pair synchronization operation was performed using the thread specific client/server event pair object, but no event pair object was associated with the thread.
//
  {$EXTERNALSYM STATUS_NO_EVENT_PAIR}
  STATUS_NO_EVENT_PAIR             =  TNTStatus($C000014E);

//
// MessageId: STATUS_UNRECOGNIZED_VOLUME
//
// MessageText:
//
// The volume does not contain a recognized file system.
// Please make sure that all required file system drivers are loaded and that the volume is not corrupt.
//
  {$EXTERNALSYM STATUS_UNRECOGNIZED_VOLUME}
  STATUS_UNRECOGNIZED_VOLUME       =  TNTStatus($C000014F);

//
// MessageId: STATUS_SERIAL_NO_DEVICE_INITED
//
// MessageText:
//
// No serial device was successfully initialized. The serial driver will unload.
//
  {$EXTERNALSYM STATUS_SERIAL_NO_DEVICE_INITED}
  STATUS_SERIAL_NO_DEVICE_INITED   =  TNTStatus($C0000150);

//
// MessageId: STATUS_NO_SUCH_ALIAS
//
// MessageText:
//
// The specified local group does not exist.
//
  {$EXTERNALSYM STATUS_NO_SUCH_ALIAS}
  STATUS_NO_SUCH_ALIAS             =  TNTStatus($C0000151);

//
// MessageId: STATUS_MEMBER_NOT_IN_ALIAS
//
// MessageText:
//
// The specified account name is not a member of the group.
//
  {$EXTERNALSYM STATUS_MEMBER_NOT_IN_ALIAS}
  STATUS_MEMBER_NOT_IN_ALIAS       =  TNTStatus($C0000152);

//
// MessageId: STATUS_MEMBER_IN_ALIAS
//
// MessageText:
//
// The specified account name is already a member of the group.
//
  {$EXTERNALSYM STATUS_MEMBER_IN_ALIAS}
  STATUS_MEMBER_IN_ALIAS           =  TNTStatus($C0000153);

//
// MessageId: STATUS_ALIAS_EXISTS
//
// MessageText:
//
// The specified local group already exists.
//
  {$EXTERNALSYM STATUS_ALIAS_EXISTS}
  STATUS_ALIAS_EXISTS              =  TNTStatus($C0000154);

//
// MessageId: STATUS_LOGON_NOT_GRANTED
//
// MessageText:
//
// A requested type of logon (e.g., Interactive, Network, Service) is not granted by the target system's local security policy.
// Please ask the system administrator to grant the necessary form of logon.
//
  {$EXTERNALSYM STATUS_LOGON_NOT_GRANTED}
  STATUS_LOGON_NOT_GRANTED         =  TNTStatus($C0000155);

//
// MessageId: STATUS_TOO_MANY_SECRETS
//
// MessageText:
//
// The maximum number of secrets that may be stored in a single system has been exceeded. The length and number of secrets is limited to satisfy United States State Department export restrictions.
//
  {$EXTERNALSYM STATUS_TOO_MANY_SECRETS}
  STATUS_TOO_MANY_SECRETS          =  TNTStatus($C0000156);

//
// MessageId: STATUS_SECRET_TOO_LONG
//
// MessageText:
//
// The length of a secret exceeds the maximum length allowed. The length and number of secrets is limited to satisfy United States State Department export restrictions.
//
  {$EXTERNALSYM STATUS_SECRET_TOO_LONG}
  STATUS_SECRET_TOO_LONG           =  TNTStatus($C0000157);

//
// MessageId: STATUS_INTERNAL_DB_ERROR
//
// MessageText:
//
// The Local Security Authority (LSA) database contains an internal inconsistency.
//
  {$EXTERNALSYM STATUS_INTERNAL_DB_ERROR}
  STATUS_INTERNAL_DB_ERROR         =  TNTStatus($C0000158);

//
// MessageId: STATUS_FULLSCREEN_MODE
//
// MessageText:
//
// The requested operation cannot be performed in fullscreen mode.
//
  {$EXTERNALSYM STATUS_FULLSCREEN_MODE}
  STATUS_FULLSCREEN_MODE           =  TNTStatus($C0000159);

//
// MessageId: STATUS_TOO_MANY_CONTEXT_IDS
//
// MessageText:
//
// During a logon attempt, the user's security context accumulated too many security IDs. This is a very unusual situation.
// Remove the user from some global or local groups to reduce the number of security ids to incorporate into the security context.
//
  {$EXTERNALSYM STATUS_TOO_MANY_CONTEXT_IDS}
  STATUS_TOO_MANY_CONTEXT_IDS      =  TNTStatus($C000015A);

//
// MessageId: STATUS_LOGON_TYPE_NOT_GRANTED
//
// MessageText:
//
// A user has requested a type of logon (e.g., interactive or network) that has not been granted. An administrator has control over who may logon interactively and through the network.
//
  {$EXTERNALSYM STATUS_LOGON_TYPE_NOT_GRANTED}
  STATUS_LOGON_TYPE_NOT_GRANTED    =  TNTStatus($C000015B);

//
// MessageId: STATUS_NOT_REGISTRY_FILE
//
// MessageText:
//
// The system has attempted to load or restore a file into the registry, and the specified file is not in the format of a registry file.
//
  {$EXTERNALSYM STATUS_NOT_REGISTRY_FILE}
  STATUS_NOT_REGISTRY_FILE         =  TNTStatus($C000015C);

//
// MessageId: STATUS_NT_CROSS_ENCRYPTION_REQUIRED
//
// MessageText:
//
// An attempt was made to change a user password in the security account manager without providing the necessary Windows cross-encrypted password.
//
  {$EXTERNALSYM STATUS_NT_CROSS_ENCRYPTION_REQUIRED}
  STATUS_NT_CROSS_ENCRYPTION_REQUIRED =  TNTStatus($C000015D);

//
// MessageId: STATUS_DOMAIN_CTRLR_CONFIG_ERROR
//
// MessageText:
//
// A Windows Server has an incorrect configuration.
//
  {$EXTERNALSYM STATUS_DOMAIN_CTRLR_CONFIG_ERROR}
  STATUS_DOMAIN_CTRLR_CONFIG_ERROR =  TNTStatus($C000015E);

//
// MessageId: STATUS_FT_MISSING_MEMBER
//
// MessageText:
//
// An attempt was made to explicitly access the secondary copy of information via a device control to the Fault Tolerance driver and the secondary copy is not present in the system.
//
  {$EXTERNALSYM STATUS_FT_MISSING_MEMBER}
  STATUS_FT_MISSING_MEMBER         =  TNTStatus($C000015F);

//
// MessageId: STATUS_ILL_FORMED_SERVICE_ENTRY
//
// MessageText:
//
// A configuration registry node representing a driver service entry was ill-formed and did not contain required value entries.
//
  {$EXTERNALSYM STATUS_ILL_FORMED_SERVICE_ENTRY}
  STATUS_ILL_FORMED_SERVICE_ENTRY  =  TNTStatus($C0000160);

//
// MessageId: STATUS_ILLEGAL_CHARACTER
//
// MessageText:
//
// An illegal character was encountered. For a multi-byte character set this includes a lead byte without a succeeding trail byte. For the Unicode character set this includes the characters 0xFFFF and 0xFFFE.
//
  {$EXTERNALSYM STATUS_ILLEGAL_CHARACTER}
  STATUS_ILLEGAL_CHARACTER         =  TNTStatus($C0000161);

//
// MessageId: STATUS_UNMAPPABLE_CHARACTER
//
// MessageText:
//
// No mapping for the Unicode character exists in the target multi-byte code page.
//
  {$EXTERNALSYM STATUS_UNMAPPABLE_CHARACTER}
  STATUS_UNMAPPABLE_CHARACTER      =  TNTStatus($C0000162);

//
// MessageId: STATUS_UNDEFINED_CHARACTER
//
// MessageText:
//
// The Unicode character is not defined in the Unicode character set installed on the system.
//
  {$EXTERNALSYM STATUS_UNDEFINED_CHARACTER}
  STATUS_UNDEFINED_CHARACTER       =  TNTStatus($C0000163);

//
// MessageId: STATUS_FLOPPY_VOLUME
//
// MessageText:
//
// The paging file cannot be created on a floppy diskette.
//
  {$EXTERNALSYM STATUS_FLOPPY_VOLUME}
  STATUS_FLOPPY_VOLUME             =  TNTStatus($C0000164);

//
// MessageId: STATUS_FLOPPY_ID_MARK_NOT_FOUND
//
// MessageText:
//
// {Floppy Disk Error}
// While accessing a floppy disk, an ID address mark was not found.
//
  {$EXTERNALSYM STATUS_FLOPPY_ID_MARK_NOT_FOUND}
  STATUS_FLOPPY_ID_MARK_NOT_FOUND  =  TNTStatus($C0000165);

//
// MessageId: STATUS_FLOPPY_WRONG_CYLINDER
//
// MessageText:
//
// {Floppy Disk Error}
// While accessing a floppy disk, the track address from the sector ID field was found to be different than the track address maintained by the controller.
//
  {$EXTERNALSYM STATUS_FLOPPY_WRONG_CYLINDER}
  STATUS_FLOPPY_WRONG_CYLINDER     =  TNTStatus($C0000166);

//
// MessageId: STATUS_FLOPPY_UNKNOWN_ERROR
//
// MessageText:
//
// {Floppy Disk Error}
// The floppy disk controller reported an error that is not recognized by the floppy disk driver.
//
  {$EXTERNALSYM STATUS_FLOPPY_UNKNOWN_ERROR}
  STATUS_FLOPPY_UNKNOWN_ERROR      =  TNTStatus($C0000167);

//
// MessageId: STATUS_FLOPPY_BAD_REGISTERS
//
// MessageText:
//
// {Floppy Disk Error}
// While accessing a floppy-disk, the controller returned inconsistent results via its registers.
//
  {$EXTERNALSYM STATUS_FLOPPY_BAD_REGISTERS}
  STATUS_FLOPPY_BAD_REGISTERS      =  TNTStatus($C0000168);

//
// MessageId: STATUS_DISK_RECALIBRATE_FAILED
//
// MessageText:
//
// {Hard Disk Error}
// While accessing the hard disk, a recalibrate operation failed, even after retries.
//
  {$EXTERNALSYM STATUS_DISK_RECALIBRATE_FAILED}
  STATUS_DISK_RECALIBRATE_FAILED   =  TNTStatus($C0000169);

//
// MessageId: STATUS_DISK_OPERATION_FAILED
//
// MessageText:
//
// {Hard Disk Error}
// While accessing the hard disk, a disk operation failed even after retries.
//
  {$EXTERNALSYM STATUS_DISK_OPERATION_FAILED}
  STATUS_DISK_OPERATION_FAILED     =  TNTStatus($C000016A);

//
// MessageId: STATUS_DISK_RESET_FAILED
//
// MessageText:
//
// {Hard Disk Error}
// While accessing the hard disk, a disk controller reset was needed, but even that failed.
//
  {$EXTERNALSYM STATUS_DISK_RESET_FAILED}
  STATUS_DISK_RESET_FAILED         =  TNTStatus($C000016B);

//
// MessageId: STATUS_SHARED_IRQ_BUSY
//
// MessageText:
//
// An attempt was made to open a device that was sharing an IRQ with other devices.
// At least one other device that uses that IRQ was already opened.
// Two concurrent opens of devices that share an IRQ and only work via interrupts is not supported for the particular bus type that the devices use.
//
  {$EXTERNALSYM STATUS_SHARED_IRQ_BUSY}
  STATUS_SHARED_IRQ_BUSY           =  TNTStatus($C000016C);

//
// MessageId: STATUS_FT_ORPHANING
//
// MessageText:
//
// {FT Orphaning}
// A disk that is part of a fault-tolerant volume can no longer be accessed.
//
  {$EXTERNALSYM STATUS_FT_ORPHANING}
  STATUS_FT_ORPHANING              =  TNTStatus($C000016D);

//
// MessageId: STATUS_BIOS_FAILED_TO_CONNECT_INTERRUPT
//
// MessageText:
//
// The system bios failed to connect a system interrupt to the device or bus for
// which the device is connected.
//
  {$EXTERNALSYM STATUS_BIOS_FAILED_TO_CONNECT_INTERRUPT}
  STATUS_BIOS_FAILED_TO_CONNECT_INTERRUPT =  TNTStatus($C000016E);

//
// MessageId: STATUS_PARTITION_FAILURE
//
// MessageText:
//
// Tape could not be partitioned.
//
  {$EXTERNALSYM STATUS_PARTITION_FAILURE}
  STATUS_PARTITION_FAILURE         =  TNTStatus($C0000172);

//
// MessageId: STATUS_INVALID_BLOCK_LENGTH
//
// MessageText:
//
// When accessing a new tape of a multivolume partition, the current blocksize is incorrect.
//
  {$EXTERNALSYM STATUS_INVALID_BLOCK_LENGTH}
  STATUS_INVALID_BLOCK_LENGTH      =  TNTStatus($C0000173);

//
// MessageId: STATUS_DEVICE_NOT_PARTITIONED
//
// MessageText:
//
// Tape partition information could not be found when loading a tape.
//
  {$EXTERNALSYM STATUS_DEVICE_NOT_PARTITIONED}
  STATUS_DEVICE_NOT_PARTITIONED    =  TNTStatus($C0000174);

//
// MessageId: STATUS_UNABLE_TO_LOCK_MEDIA
//
// MessageText:
//
// Attempt to lock the eject media mechanism fails.
//
  {$EXTERNALSYM STATUS_UNABLE_TO_LOCK_MEDIA}
  STATUS_UNABLE_TO_LOCK_MEDIA      =  TNTStatus($C0000175);

//
// MessageId: STATUS_UNABLE_TO_UNLOAD_MEDIA
//
// MessageText:
//
// Unload media fails.
//
  {$EXTERNALSYM STATUS_UNABLE_TO_UNLOAD_MEDIA}
  STATUS_UNABLE_TO_UNLOAD_MEDIA    =  TNTStatus($C0000176);

//
// MessageId: STATUS_EOM_OVERFLOW
//
// MessageText:
//
// Physical end of tape was detected.
//
  {$EXTERNALSYM STATUS_EOM_OVERFLOW}
  STATUS_EOM_OVERFLOW              =  TNTStatus($C0000177);

//
// MessageId: STATUS_NO_MEDIA
//
// MessageText:
//
// {No Media}
// There is no media in the drive.
// Please insert media into drive %hs.
//
  {$EXTERNALSYM STATUS_NO_MEDIA}
  STATUS_NO_MEDIA                  =  TNTStatus($C0000178);

//
// MessageId: STATUS_NO_SUCH_MEMBER
//
// MessageText:
//
// A member could not be added to or removed from the local group because the member does not exist.
//
  {$EXTERNALSYM STATUS_NO_SUCH_MEMBER}
  STATUS_NO_SUCH_MEMBER            =  TNTStatus($C000017A);

//
// MessageId: STATUS_INVALID_MEMBER
//
// MessageText:
//
// A new member could not be added to a local group because the member has the wrong account type.
//
  {$EXTERNALSYM STATUS_INVALID_MEMBER}
  STATUS_INVALID_MEMBER            =  TNTStatus($C000017B);

//
// MessageId: STATUS_KEY_DELETED
//
// MessageText:
//
// Illegal operation attempted on a registry key which has been marked for deletion.
//
  {$EXTERNALSYM STATUS_KEY_DELETED}
  STATUS_KEY_DELETED               =  TNTStatus($C000017C);

//
// MessageId: STATUS_NO_LOG_SPACE
//
// MessageText:
//
// System could not allocate required space in a registry log.
//
  {$EXTERNALSYM STATUS_NO_LOG_SPACE}
  STATUS_NO_LOG_SPACE              =  TNTStatus($C000017D);

//
// MessageId: STATUS_TOO_MANY_SIDS
//
// MessageText:
//
// Too many Sids have been specified.
//
  {$EXTERNALSYM STATUS_TOO_MANY_SIDS}
  STATUS_TOO_MANY_SIDS             =  TNTStatus($C000017E);

//
// MessageId: STATUS_LM_CROSS_ENCRYPTION_REQUIRED
//
// MessageText:
//
// An attempt was made to change a user password in the security account manager without providing the necessary LM cross-encrypted password.
//
  {$EXTERNALSYM STATUS_LM_CROSS_ENCRYPTION_REQUIRED}
  STATUS_LM_CROSS_ENCRYPTION_REQUIRED =  TNTStatus($C000017F);

//
// MessageId: STATUS_KEY_HAS_CHILDREN
//
// MessageText:
//
// An attempt was made to create a symbolic link in a registry key that already has subkeys or values.
//
  {$EXTERNALSYM STATUS_KEY_HAS_CHILDREN}
  STATUS_KEY_HAS_CHILDREN          =  TNTStatus($C0000180);

//
// MessageId: STATUS_CHILD_MUST_BE_VOLATILE
//
// MessageText:
//
// An attempt was made to create a Stable subkey under a Volatile parent key.
//
  {$EXTERNALSYM STATUS_CHILD_MUST_BE_VOLATILE}
  STATUS_CHILD_MUST_BE_VOLATILE    =  TNTStatus($C0000181);

//
// MessageId: STATUS_DEVICE_CONFIGURATION_ERROR
//
// MessageText:
//
// The I/O device is configured incorrectly or the configuration parameters to the driver are incorrect.
//
  {$EXTERNALSYM STATUS_DEVICE_CONFIGURATION_ERROR}
  STATUS_DEVICE_CONFIGURATION_ERROR =  TNTStatus($C0000182);

//
// MessageId: STATUS_DRIVER_INTERNAL_ERROR
//
// MessageText:
//
// An error was detected between two drivers or within an I/O driver.
//
  {$EXTERNALSYM STATUS_DRIVER_INTERNAL_ERROR}
  STATUS_DRIVER_INTERNAL_ERROR     =  TNTStatus($C0000183);

//
// MessageId: STATUS_INVALID_DEVICE_STATE
//
// MessageText:
//
// The device is not in a valid state to perform this request.
//
  {$EXTERNALSYM STATUS_INVALID_DEVICE_STATE}
  STATUS_INVALID_DEVICE_STATE      =  TNTStatus($C0000184);

//
// MessageId: STATUS_IO_DEVICE_ERROR
//
// MessageText:
//
// The I/O device reported an I/O error.
//
  {$EXTERNALSYM STATUS_IO_DEVICE_ERROR}
  STATUS_IO_DEVICE_ERROR           =  TNTStatus($C0000185);

//
// MessageId: STATUS_DEVICE_PROTOCOL_ERROR
//
// MessageText:
//
// A protocol error was detected between the driver and the device.
//
  {$EXTERNALSYM STATUS_DEVICE_PROTOCOL_ERROR}
  STATUS_DEVICE_PROTOCOL_ERROR     =  TNTStatus($C0000186);

//
// MessageId: STATUS_BACKUP_CONTROLLER
//
// MessageText:
//
// This operation is only allowed for the Primary Domain Controller of the domain.
//
  {$EXTERNALSYM STATUS_BACKUP_CONTROLLER}
  STATUS_BACKUP_CONTROLLER         =  TNTStatus($C0000187);

//
// MessageId: STATUS_LOG_FILE_FULL
//
// MessageText:
//
// Log file space is insufficient to support this operation.
//
  {$EXTERNALSYM STATUS_LOG_FILE_FULL}
  STATUS_LOG_FILE_FULL             =  TNTStatus($C0000188);

//
// MessageId: STATUS_TOO_LATE
//
// MessageText:
//
// A write operation was attempted to a volume after it was dismounted.
//
  {$EXTERNALSYM STATUS_TOO_LATE}
  STATUS_TOO_LATE                  =  TNTStatus($C0000189);

//
// MessageId: STATUS_NO_TRUST_LSA_SECRET
//
// MessageText:
//
// The workstation does not have a trust secret for the primary domain in the local LSA database.
//
  {$EXTERNALSYM STATUS_NO_TRUST_LSA_SECRET}
  STATUS_NO_TRUST_LSA_SECRET       =  TNTStatus($C000018A);

//
// MessageId: STATUS_NO_TRUST_SAM_ACCOUNT
//
// MessageText:
//
// The SAM database on the Windows Server does not have a computer account for this workstation trust relationship.
//
  {$EXTERNALSYM STATUS_NO_TRUST_SAM_ACCOUNT}
  STATUS_NO_TRUST_SAM_ACCOUNT      =  TNTStatus($C000018B);

//
// MessageId: STATUS_TRUSTED_DOMAIN_FAILURE
//
// MessageText:
//
// The logon request failed because the trust relationship between the primary domain and the trusted domain failed.
//
  {$EXTERNALSYM STATUS_TRUSTED_DOMAIN_FAILURE}
  STATUS_TRUSTED_DOMAIN_FAILURE    =  TNTStatus($C000018C);

//
// MessageId: STATUS_TRUSTED_RELATIONSHIP_FAILURE
//
// MessageText:
//
// The logon request failed because the trust relationship between this workstation and the primary domain failed.
//
  {$EXTERNALSYM STATUS_TRUSTED_RELATIONSHIP_FAILURE}
  STATUS_TRUSTED_RELATIONSHIP_FAILURE =  TNTStatus($C000018D);

//
// MessageId: STATUS_EVENTLOG_FILE_CORRUPT
//
// MessageText:
//
// The Eventlog log file is corrupt.
//
  {$EXTERNALSYM STATUS_EVENTLOG_FILE_CORRUPT}
  STATUS_EVENTLOG_FILE_CORRUPT     =  TNTStatus($C000018E);

//
// MessageId: STATUS_EVENTLOG_CANT_START
//
// MessageText:
//
// No Eventlog log file could be opened. The Eventlog service did not start.
//
  {$EXTERNALSYM STATUS_EVENTLOG_CANT_START}
  STATUS_EVENTLOG_CANT_START       =  TNTStatus($C000018F);

//
// MessageId: STATUS_TRUST_FAILURE
//
// MessageText:
//
// The network logon failed. This may be because the validation authority can't be reached.
//
  {$EXTERNALSYM STATUS_TRUST_FAILURE}
  STATUS_TRUST_FAILURE             =  TNTStatus($C0000190);

//
// MessageId: STATUS_MUTANT_LIMIT_EXCEEDED
//
// MessageText:
//
// An attempt was made to acquire a mutant such that its maximum count would have been exceeded.
//
  {$EXTERNALSYM STATUS_MUTANT_LIMIT_EXCEEDED}
  STATUS_MUTANT_LIMIT_EXCEEDED     =  TNTStatus($C0000191);

//
// MessageId: STATUS_NETLOGON_NOT_STARTED
//
// MessageText:
//
// An attempt was made to logon, but the netlogon service was not started.
//
  {$EXTERNALSYM STATUS_NETLOGON_NOT_STARTED}
  STATUS_NETLOGON_NOT_STARTED      =  TNTStatus($C0000192);

//
// MessageId: STATUS_ACCOUNT_EXPIRED
//
// MessageText:
//
// The user's account has expired.
//
  {$EXTERNALSYM STATUS_ACCOUNT_EXPIRED}
  STATUS_ACCOUNT_EXPIRED           =  TNTStatus($C0000193);    // ntsubauth

//
// MessageId: STATUS_POSSIBLE_DEADLOCK
//
// MessageText:
//
// {EXCEPTION}
// Possible deadlock condition.
//
  {$EXTERNALSYM STATUS_POSSIBLE_DEADLOCK}
  STATUS_POSSIBLE_DEADLOCK         =  TNTStatus($C0000194);

//
// MessageId: STATUS_NETWORK_CREDENTIAL_CONFLICT
//
// MessageText:
//
// Multiple connections to a server or shared resource by the same user, using more than one user name, are not allowed. Disconnect all previous connections to the server or shared resource and try again.
//
  {$EXTERNALSYM STATUS_NETWORK_CREDENTIAL_CONFLICT}
  STATUS_NETWORK_CREDENTIAL_CONFLICT =  TNTStatus($C0000195);

//
// MessageId: STATUS_REMOTE_SESSION_LIMIT
//
// MessageText:
//
// An attempt was made to establish a session to a network server, but there are already too many sessions established to that server.
//
  {$EXTERNALSYM STATUS_REMOTE_SESSION_LIMIT}
  STATUS_REMOTE_SESSION_LIMIT      =  TNTStatus($C0000196);

//
// MessageId: STATUS_EVENTLOG_FILE_CHANGED
//
// MessageText:
//
// The log file has changed between reads.
//
  {$EXTERNALSYM STATUS_EVENTLOG_FILE_CHANGED}
  STATUS_EVENTLOG_FILE_CHANGED     =  TNTStatus($C0000197);

//
// MessageId: STATUS_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT
//
// MessageText:
//
// The account used is an Interdomain Trust account. Use your global user account or local user account to access this server.
//
  {$EXTERNALSYM STATUS_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT}
  STATUS_NOLOGON_INTERDOMAIN_TRUST_ACCOUNT =  TNTStatus($C0000198);

//
// MessageId: STATUS_NOLOGON_WORKSTATION_TRUST_ACCOUNT
//
// MessageText:
//
// The account used is a Computer Account. Use your global user account or local user account to access this server.
//
  {$EXTERNALSYM STATUS_NOLOGON_WORKSTATION_TRUST_ACCOUNT}
  STATUS_NOLOGON_WORKSTATION_TRUST_ACCOUNT =  TNTStatus($C0000199);

//
// MessageId: STATUS_NOLOGON_SERVER_TRUST_ACCOUNT
//
// MessageText:
//
// The account used is an Server Trust account. Use your global user account or local user account to access this server.
//
  {$EXTERNALSYM STATUS_NOLOGON_SERVER_TRUST_ACCOUNT}
  STATUS_NOLOGON_SERVER_TRUST_ACCOUNT =  TNTStatus($C000019A);

//
// MessageId: STATUS_DOMAIN_TRUST_INCONSISTENT
//
// MessageText:
//
// The name or SID of the domain specified is inconsistent with the trust information for that domain.
//
  {$EXTERNALSYM STATUS_DOMAIN_TRUST_INCONSISTENT}
  STATUS_DOMAIN_TRUST_INCONSISTENT =  TNTStatus($C000019B);

//
// MessageId: STATUS_FS_DRIVER_REQUIRED
//
// MessageText:
//
// A volume has been accessed for which a file system driver is required that has not yet been loaded.
//
  {$EXTERNALSYM STATUS_FS_DRIVER_REQUIRED}
  STATUS_FS_DRIVER_REQUIRED        =  TNTStatus($C000019C);

//
// MessageId: STATUS_IMAGE_ALREADY_LOADED_AS_DLL
//
// MessageText:
//
// Indicates that the specified image is already loaded as a DLL.
//
  {$EXTERNALSYM STATUS_IMAGE_ALREADY_LOADED_AS_DLL}
  STATUS_IMAGE_ALREADY_LOADED_AS_DLL =  TNTStatus($C000019D);

//
// MessageId: STATUS_NETWORK_OPEN_RESTRICTION
//
// MessageText:
//
// A remote open failed because the network open restrictions were not satisfied.
//
  {$EXTERNALSYM STATUS_NETWORK_OPEN_RESTRICTION}
  STATUS_NETWORK_OPEN_RESTRICTION  =  TNTStatus($C0000201);

//
// MessageId: STATUS_NO_USER_SESSION_KEY
//
// MessageText:
//
// There is no user session key for the specified logon session.
//
  {$EXTERNALSYM STATUS_NO_USER_SESSION_KEY}
  STATUS_NO_USER_SESSION_KEY       =  TNTStatus($C0000202);

//
// MessageId: STATUS_USER_SESSION_DELETED
//
// MessageText:
//
// The remote user session has been deleted.
//
  {$EXTERNALSYM STATUS_USER_SESSION_DELETED}
  STATUS_USER_SESSION_DELETED      =  TNTStatus($C0000203);

//
// MessageId: STATUS_RESOURCE_LANG_NOT_FOUND
//
// MessageText:
//
// Indicates the specified resource language ID cannot be found in the
// image file.
//
  {$EXTERNALSYM STATUS_RESOURCE_LANG_NOT_FOUND}
  STATUS_RESOURCE_LANG_NOT_FOUND   =  TNTStatus($C0000204);

//
// MessageId: STATUS_INSUFF_SERVER_RESOURCES
//
// MessageText:
//
// Insufficient server resources exist to complete the request.
//
  {$EXTERNALSYM STATUS_INSUFF_SERVER_RESOURCES}
  STATUS_INSUFF_SERVER_RESOURCES   =  TNTStatus($C0000205);

//
// MessageId: STATUS_INVALID_BUFFER_SIZE
//
// MessageText:
//
// The size of the buffer is invalid for the specified operation.
//
  {$EXTERNALSYM STATUS_INVALID_BUFFER_SIZE}
  STATUS_INVALID_BUFFER_SIZE       =  TNTStatus($C0000206);

//
// MessageId: STATUS_INVALID_ADDRESS_COMPONENT
//
// MessageText:
//
// The transport rejected the network address specified as invalid.
//
  {$EXTERNALSYM STATUS_INVALID_ADDRESS_COMPONENT}
  STATUS_INVALID_ADDRESS_COMPONENT =  TNTStatus($C0000207);

//
// MessageId: STATUS_INVALID_ADDRESS_WILDCARD
//
// MessageText:
//
// The transport rejected the network address specified due to an invalid use of a wildcard.
//
  {$EXTERNALSYM STATUS_INVALID_ADDRESS_WILDCARD}
  STATUS_INVALID_ADDRESS_WILDCARD  =  TNTStatus($C0000208);

//
// MessageId: STATUS_TOO_MANY_ADDRESSES
//
// MessageText:
//
// The transport address could not be opened because all the available addresses are in use.
//
  {$EXTERNALSYM STATUS_TOO_MANY_ADDRESSES}
  STATUS_TOO_MANY_ADDRESSES        =  TNTStatus($C0000209);

//
// MessageId: STATUS_ADDRESS_ALREADY_EXISTS
//
// MessageText:
//
// The transport address could not be opened because it already exists.
//
  {$EXTERNALSYM STATUS_ADDRESS_ALREADY_EXISTS}
  STATUS_ADDRESS_ALREADY_EXISTS    =  TNTStatus($C000020A);

//
// MessageId: STATUS_ADDRESS_CLOSED
//
// MessageText:
//
// The transport address is now closed.
//
  {$EXTERNALSYM STATUS_ADDRESS_CLOSED}
  STATUS_ADDRESS_CLOSED            =  TNTStatus($C000020B);

//
// MessageId: STATUS_CONNECTION_DISCONNECTED
//
// MessageText:
//
// The transport connection is now disconnected.
//
  {$EXTERNALSYM STATUS_CONNECTION_DISCONNECTED}
  STATUS_CONNECTION_DISCONNECTED   =  TNTStatus($C000020C);

//
// MessageId: STATUS_CONNECTION_RESET
//
// MessageText:
//
// The transport connection has been reset.
//
  {$EXTERNALSYM STATUS_CONNECTION_RESET}
  STATUS_CONNECTION_RESET          =  TNTStatus($C000020D);

//
// MessageId: STATUS_TOO_MANY_NODES
//
// MessageText:
//
// The transport cannot dynamically acquire any more nodes.
//
  {$EXTERNALSYM STATUS_TOO_MANY_NODES}
  STATUS_TOO_MANY_NODES            =  TNTStatus($C000020E);

//
// MessageId: STATUS_TRANSACTION_ABORTED
//
// MessageText:
//
// The transport aborted a pending transaction.
//
  {$EXTERNALSYM STATUS_TRANSACTION_ABORTED}
  STATUS_TRANSACTION_ABORTED       =  TNTStatus($C000020F);

//
// MessageId: STATUS_TRANSACTION_TIMED_OUT
//
// MessageText:
//
// The transport timed out a request waiting for a response.
//
  {$EXTERNALSYM STATUS_TRANSACTION_TIMED_OUT}
  STATUS_TRANSACTION_TIMED_OUT     =  TNTStatus($C0000210);

//
// MessageId: STATUS_TRANSACTION_NO_RELEASE
//
// MessageText:
//
// The transport did not receive a release for a pending response.
//
  {$EXTERNALSYM STATUS_TRANSACTION_NO_RELEASE}
  STATUS_TRANSACTION_NO_RELEASE    =  TNTStatus($C0000211);

//
// MessageId: STATUS_TRANSACTION_NO_MATCH
//
// MessageText:
//
// The transport did not find a transaction matching the specific
// token.
//
  {$EXTERNALSYM STATUS_TRANSACTION_NO_MATCH}
  STATUS_TRANSACTION_NO_MATCH      =  TNTStatus($C0000212);

//
// MessageId: STATUS_TRANSACTION_RESPONDED
//
// MessageText:
//
// The transport had previously responded to a transaction request.
//
  {$EXTERNALSYM STATUS_TRANSACTION_RESPONDED}
  STATUS_TRANSACTION_RESPONDED     =  TNTStatus($C0000213);

//
// MessageId: STATUS_TRANSACTION_INVALID_ID
//
// MessageText:
//
// The transport does not recognized the transaction request identifier specified.
//
  {$EXTERNALSYM STATUS_TRANSACTION_INVALID_ID}
  STATUS_TRANSACTION_INVALID_ID    =  TNTStatus($C0000214);

//
// MessageId: STATUS_TRANSACTION_INVALID_TYPE
//
// MessageText:
//
// The transport does not recognize the transaction request type specified.
//
  {$EXTERNALSYM STATUS_TRANSACTION_INVALID_TYPE}
  STATUS_TRANSACTION_INVALID_TYPE  =  TNTStatus($C0000215);

//
// MessageId: STATUS_NOT_SERVER_SESSION
//
// MessageText:
//
// The transport can only process the specified request on the server side of a session.
//
  {$EXTERNALSYM STATUS_NOT_SERVER_SESSION}
  STATUS_NOT_SERVER_SESSION        =  TNTStatus($C0000216);

//
// MessageId: STATUS_NOT_CLIENT_SESSION
//
// MessageText:
//
// The transport can only process the specified request on the client side of a session.
//
  {$EXTERNALSYM STATUS_NOT_CLIENT_SESSION}
  STATUS_NOT_CLIENT_SESSION        =  TNTStatus($C0000217);

//
// MessageId: STATUS_CANNOT_LOAD_REGISTRY_FILE
//
// MessageText:
//
// {Registry File Failure}
// The registry cannot load the hive (file):
// %hs
// or its log or alternate.
// It is corrupt, absent, or not writable.
//
  {$EXTERNALSYM STATUS_CANNOT_LOAD_REGISTRY_FILE}
  STATUS_CANNOT_LOAD_REGISTRY_FILE =  TNTStatus($C0000218);

//
// MessageId: STATUS_DEBUG_ATTACH_FAILED
//
// MessageText:
//
// {Unexpected Failure in DebugActiveProcess}
// An unexpected failure occurred while processing a DebugActiveProcess API request. You may choose OK to terminate the process, or Cancel to ignore the error.
//
  {$EXTERNALSYM STATUS_DEBUG_ATTACH_FAILED}
  STATUS_DEBUG_ATTACH_FAILED       =  TNTStatus($C0000219);

//
// MessageId: STATUS_SYSTEM_PROCESS_TERMINATED
//
// MessageText:
//
// {Fatal System Error}
// The %hs system process terminated unexpectedly with a status of 0x%08x (0x%08x 0x%08x).
// The system has been shut down.
//
  {$EXTERNALSYM STATUS_SYSTEM_PROCESS_TERMINATED}
  STATUS_SYSTEM_PROCESS_TERMINATED =  TNTStatus($C000021A);

//
// MessageId: STATUS_DATA_NOT_ACCEPTED
//
// MessageText:
//
// {Data Not Accepted}
// The TDI client could not handle the data received during an indication.
//
  {$EXTERNALSYM STATUS_DATA_NOT_ACCEPTED}
  STATUS_DATA_NOT_ACCEPTED         =  TNTStatus($C000021B);

//
// MessageId: STATUS_NO_BROWSER_SERVERS_FOUND
//
// MessageText:
//
// {Unable to Retrieve Browser Server List}
// The list of servers for this workgroup is not currently available.
//
  {$EXTERNALSYM STATUS_NO_BROWSER_SERVERS_FOUND}
  STATUS_NO_BROWSER_SERVERS_FOUND  =  TNTStatus($C000021C);

//
// MessageId: STATUS_VDM_HARD_ERROR
//
// MessageText:
//
// NTVDM encountered a hard error.
//
  {$EXTERNALSYM STATUS_VDM_HARD_ERROR}
  STATUS_VDM_HARD_ERROR            =  TNTStatus($C000021D);

//
// MessageId: STATUS_DRIVER_CANCEL_TIMEOUT
//
// MessageText:
//
// {Cancel Timeout}
// The driver %hs failed to complete a cancelled I/O request in the allotted time.
//
  {$EXTERNALSYM STATUS_DRIVER_CANCEL_TIMEOUT}
  STATUS_DRIVER_CANCEL_TIMEOUT     =  TNTStatus($C000021E);

//
// MessageId: STATUS_REPLY_MESSAGE_MISMATCH
//
// MessageText:
//
// {Reply Message Mismatch}
// An attempt was made to reply to an LPC message, but the thread specified by the client ID in the message was not waiting on that message.
//
  {$EXTERNALSYM STATUS_REPLY_MESSAGE_MISMATCH}
  STATUS_REPLY_MESSAGE_MISMATCH    =  TNTStatus($C000021F);

//
// MessageId: STATUS_MAPPED_ALIGNMENT
//
// MessageText:
//
// {Mapped View Alignment Incorrect}
// An attempt was made to map a view of a file, but either the specified base address or the offset into the file were not aligned on the proper allocation granularity.
//
  {$EXTERNALSYM STATUS_MAPPED_ALIGNMENT}
  STATUS_MAPPED_ALIGNMENT          =  TNTStatus($C0000220);

//
// MessageId: STATUS_IMAGE_CHECKSUM_MISMATCH
//
// MessageText:
//
// {Bad Image Checksum}
// The image %hs is possibly corrupt. The header checksum does not match the computed checksum.
//
  {$EXTERNALSYM STATUS_IMAGE_CHECKSUM_MISMATCH}
  STATUS_IMAGE_CHECKSUM_MISMATCH   =  TNTStatus($C0000221);

//
// MessageId: STATUS_LOST_WRITEBEHIND_DATA
//
// MessageText:
//
// {Delayed Write Failed}
// Windows was unable to save all the data for the file %hs. The data has been lost.
// This error may be caused by a failure of your computer hardware or network connection. Please try to save this file elsewhere.
//
  {$EXTERNALSYM STATUS_LOST_WRITEBEHIND_DATA}
  STATUS_LOST_WRITEBEHIND_DATA     =  TNTStatus($C0000222);

//
// MessageId: STATUS_CLIENT_SERVER_PARAMETERS_INVALID
//
// MessageText:
//
// The parameter(s) passed to the server in the client/server shared memory window were invalid. Too much data may have been put in the shared memory window.
//
  {$EXTERNALSYM STATUS_CLIENT_SERVER_PARAMETERS_INVALID}
  STATUS_CLIENT_SERVER_PARAMETERS_INVALID =  TNTStatus($C0000223);

//
// MessageId: STATUS_PASSWORD_MUST_CHANGE
//
// MessageText:
//
// The user's password must be changed before logging on the first time.
//
  {$EXTERNALSYM STATUS_PASSWORD_MUST_CHANGE}
  STATUS_PASSWORD_MUST_CHANGE      =  TNTStatus($C0000224);    // ntsubauth

//
// MessageId: STATUS_NOT_FOUND
//
// MessageText:
//
// The object was not found.
//
  {$EXTERNALSYM STATUS_NOT_FOUND}
  STATUS_NOT_FOUND                 =  TNTStatus($C0000225);

//
// MessageId: STATUS_NOT_TINY_STREAM
//
// MessageText:
//
// The stream is not a tiny stream.
//
  {$EXTERNALSYM STATUS_NOT_TINY_STREAM}
  STATUS_NOT_TINY_STREAM           =  TNTStatus($C0000226);

//
// MessageId: STATUS_RECOVERY_FAILURE
//
// MessageText:
//
// A transaction recover failed.
//
  {$EXTERNALSYM STATUS_RECOVERY_FAILURE}
  STATUS_RECOVERY_FAILURE          =  TNTStatus($C0000227);

//
// MessageId: STATUS_STACK_OVERFLOW_READ
//
// MessageText:
//
// The request must be handled by the stack overflow code.
//
  {$EXTERNALSYM STATUS_STACK_OVERFLOW_READ}
  STATUS_STACK_OVERFLOW_READ       =  TNTStatus($C0000228);

//
// MessageId: STATUS_FAIL_CHECK
//
// MessageText:
//
// A consistency check failed.
//
  {$EXTERNALSYM STATUS_FAIL_CHECK}
  STATUS_FAIL_CHECK                =  TNTStatus($C0000229);

//
// MessageId: STATUS_DUPLICATE_OBJECTID
//
// MessageText:
//
// The attempt to insert the ID in the index failed because the ID is already in the index.
//
  {$EXTERNALSYM STATUS_DUPLICATE_OBJECTID}
  STATUS_DUPLICATE_OBJECTID        =  TNTStatus($C000022A);

//
// MessageId: STATUS_OBJECTID_EXISTS
//
// MessageText:
//
// The attempt to set the object's ID failed because the object already has an ID.
//
  {$EXTERNALSYM STATUS_OBJECTID_EXISTS}
  STATUS_OBJECTID_EXISTS           =  TNTStatus($C000022B);

//
// MessageId: STATUS_CONVERT_TO_LARGE
//
// MessageText:
//
// Internal OFS status codes indicating how an allocation operation is handled. Either it is retried after the containing onode is moved or the extent stream is converted to a large stream.
//
  {$EXTERNALSYM STATUS_CONVERT_TO_LARGE}
  STATUS_CONVERT_TO_LARGE          =  TNTStatus($C000022C);

//
// MessageId: STATUS_RETRY
//
// MessageText:
//
// The request needs to be retried.
//
  {$EXTERNALSYM STATUS_RETRY}
  STATUS_RETRY                     =  TNTStatus($C000022D);

//
// MessageId: STATUS_FOUND_OUT_OF_SCOPE
//
// MessageText:
//
// The attempt to find the object found an object matching by ID on the volume but it is out of the scope of the handle used for the operation.
//
  {$EXTERNALSYM STATUS_FOUND_OUT_OF_SCOPE}
  STATUS_FOUND_OUT_OF_SCOPE        =  TNTStatus($C000022E);

//
// MessageId: STATUS_ALLOCATE_BUCKET
//
// MessageText:
//
// The bucket array must be grown. Retry transaction after doing so.
//
  {$EXTERNALSYM STATUS_ALLOCATE_BUCKET}
  STATUS_ALLOCATE_BUCKET           =  TNTStatus($C000022F);

//
// MessageId: STATUS_PROPSET_NOT_FOUND
//
// MessageText:
//
// The property set specified does not exist on the object.
//
  {$EXTERNALSYM STATUS_PROPSET_NOT_FOUND}
  STATUS_PROPSET_NOT_FOUND         =  TNTStatus($C0000230);

//
// MessageId: STATUS_MARSHALL_OVERFLOW
//
// MessageText:
//
// The user/kernel marshalling buffer has overflowed.
//
  {$EXTERNALSYM STATUS_MARSHALL_OVERFLOW}
  STATUS_MARSHALL_OVERFLOW         =  TNTStatus($C0000231);

//
// MessageId: STATUS_INVALID_VARIANT
//
// MessageText:
//
// The supplied variant structure contains invalid data.
//
  {$EXTERNALSYM STATUS_INVALID_VARIANT}
  STATUS_INVALID_VARIANT           =  TNTStatus($C0000232);

//
// MessageId: STATUS_DOMAIN_CONTROLLER_NOT_FOUND
//
// MessageText:
//
// Could not find a domain controller for this domain.
//
  {$EXTERNALSYM STATUS_DOMAIN_CONTROLLER_NOT_FOUND}
  STATUS_DOMAIN_CONTROLLER_NOT_FOUND =  TNTStatus($C0000233);

//
// MessageId: STATUS_ACCOUNT_LOCKED_OUT
//
// MessageText:
//
// The user account has been automatically locked because too many invalid logon attempts or password change attempts have been requested.
//
  {$EXTERNALSYM STATUS_ACCOUNT_LOCKED_OUT}
  STATUS_ACCOUNT_LOCKED_OUT        =  TNTStatus($C0000234);    // ntsubauth

//
// MessageId: STATUS_HANDLE_NOT_CLOSABLE
//
// MessageText:
//
// NtClose was called on a handle that was protected from close via NtSetInformationObject.
//
  {$EXTERNALSYM STATUS_HANDLE_NOT_CLOSABLE}
  STATUS_HANDLE_NOT_CLOSABLE       =  TNTStatus($C0000235);

//
// MessageId: STATUS_CONNECTION_REFUSED
//
// MessageText:
//
// The transport connection attempt was refused by the remote system.
//
  {$EXTERNALSYM STATUS_CONNECTION_REFUSED}
  STATUS_CONNECTION_REFUSED        =  TNTStatus($C0000236);

//
// MessageId: STATUS_GRACEFUL_DISCONNECT
//
// MessageText:
//
// The transport connection was gracefully closed.
//
  {$EXTERNALSYM STATUS_GRACEFUL_DISCONNECT}
  STATUS_GRACEFUL_DISCONNECT       =  TNTStatus($C0000237);

//
// MessageId: STATUS_ADDRESS_ALREADY_ASSOCIATED
//
// MessageText:
//
// The transport endpoint already has an address associated with it.
//
  {$EXTERNALSYM STATUS_ADDRESS_ALREADY_ASSOCIATED}
  STATUS_ADDRESS_ALREADY_ASSOCIATED =  TNTStatus($C0000238);

//
// MessageId: STATUS_ADDRESS_NOT_ASSOCIATED
//
// MessageText:
//
// An address has not yet been associated with the transport endpoint.
//
  {$EXTERNALSYM STATUS_ADDRESS_NOT_ASSOCIATED}
  STATUS_ADDRESS_NOT_ASSOCIATED    =  TNTStatus($C0000239);

//
// MessageId: STATUS_CONNECTION_INVALID
//
// MessageText:
//
// An operation was attempted on a nonexistent transport connection.
//
  {$EXTERNALSYM STATUS_CONNECTION_INVALID}
  STATUS_CONNECTION_INVALID        =  TNTStatus($C000023A);

//
// MessageId: STATUS_CONNECTION_ACTIVE
//
// MessageText:
//
// An invalid operation was attempted on an active transport connection.
//
  {$EXTERNALSYM STATUS_CONNECTION_ACTIVE}
  STATUS_CONNECTION_ACTIVE         =  TNTStatus($C000023B);

//
// MessageId: STATUS_NETWORK_UNREACHABLE
//
// MessageText:
//
// The remote network is not reachable by the transport.
//
  {$EXTERNALSYM STATUS_NETWORK_UNREACHABLE}
  STATUS_NETWORK_UNREACHABLE       =  TNTStatus($C000023C);

//
// MessageId: STATUS_HOST_UNREACHABLE
//
// MessageText:
//
// The remote system is not reachable by the transport.
//
  {$EXTERNALSYM STATUS_HOST_UNREACHABLE}
  STATUS_HOST_UNREACHABLE          =  TNTStatus($C000023D);

//
// MessageId: STATUS_PROTOCOL_UNREACHABLE
//
// MessageText:
//
// The remote system does not support the transport protocol.
//
  {$EXTERNALSYM STATUS_PROTOCOL_UNREACHABLE}
  STATUS_PROTOCOL_UNREACHABLE      =  TNTStatus($C000023E);

//
// MessageId: STATUS_PORT_UNREACHABLE
//
// MessageText:
//
// No service is operating at the destination port of the transport on the remote system.
//
  {$EXTERNALSYM STATUS_PORT_UNREACHABLE}
  STATUS_PORT_UNREACHABLE          =  TNTStatus($C000023F);

//
// MessageId: STATUS_REQUEST_ABORTED
//
// MessageText:
//
// The request was aborted.
//
  {$EXTERNALSYM STATUS_REQUEST_ABORTED}
  STATUS_REQUEST_ABORTED           =  TNTStatus($C0000240);

//
// MessageId: STATUS_CONNECTION_ABORTED
//
// MessageText:
//
// The transport connection was aborted by the local system.
//
  {$EXTERNALSYM STATUS_CONNECTION_ABORTED}
  STATUS_CONNECTION_ABORTED        =  TNTStatus($C0000241);

//
// MessageId: STATUS_BAD_COMPRESSION_BUFFER
//
// MessageText:
//
// The specified buffer contains ill-formed data.
//
  {$EXTERNALSYM STATUS_BAD_COMPRESSION_BUFFER}
  STATUS_BAD_COMPRESSION_BUFFER    =  TNTStatus($C0000242);

//
// MessageId: STATUS_USER_MAPPED_FILE
//
// MessageText:
//
// The requested operation cannot be performed on a file with a user mapped section open.
//
  {$EXTERNALSYM STATUS_USER_MAPPED_FILE}
  STATUS_USER_MAPPED_FILE          =  TNTStatus($C0000243);

//
// MessageId: STATUS_AUDIT_FAILED
//
// MessageText:
//
// {Audit Failed}
// An attempt to generate a security audit failed.
//
  {$EXTERNALSYM STATUS_AUDIT_FAILED}
  STATUS_AUDIT_FAILED              =  TNTStatus($C0000244);

//
// MessageId: STATUS_TIMER_RESOLUTION_NOT_SET
//
// MessageText:
//
// The timer resolution was not previously set by the current process.
//
  {$EXTERNALSYM STATUS_TIMER_RESOLUTION_NOT_SET}
  STATUS_TIMER_RESOLUTION_NOT_SET  =  TNTStatus($C0000245);

//
// MessageId: STATUS_CONNECTION_COUNT_LIMIT
//
// MessageText:
//
// A connection to the server could not be made because the limit on the number of concurrent connections for this account has been reached.
//
  {$EXTERNALSYM STATUS_CONNECTION_COUNT_LIMIT}
  STATUS_CONNECTION_COUNT_LIMIT    =  TNTStatus($C0000246);

//
// MessageId: STATUS_LOGIN_TIME_RESTRICTION
//
// MessageText:
//
// Attempting to login during an unauthorized time of day for this account.
//
  {$EXTERNALSYM STATUS_LOGIN_TIME_RESTRICTION}
  STATUS_LOGIN_TIME_RESTRICTION    =  TNTStatus($C0000247);

//
// MessageId: STATUS_LOGIN_WKSTA_RESTRICTION
//
// MessageText:
//
// The account is not authorized to login from this station.
//
  {$EXTERNALSYM STATUS_LOGIN_WKSTA_RESTRICTION}
  STATUS_LOGIN_WKSTA_RESTRICTION   =  TNTStatus($C0000248);

//
// MessageId: STATUS_IMAGE_MP_UP_MISMATCH
//
// MessageText:
//
// {UP/MP Image Mismatch}
// The image %hs has been modified for use on a uniprocessor system, but you are running it on a multiprocessor machine.
// Please reinstall the image file.
//
  {$EXTERNALSYM STATUS_IMAGE_MP_UP_MISMATCH}
  STATUS_IMAGE_MP_UP_MISMATCH      =  TNTStatus($C0000249);

//
// MessageId: STATUS_INSUFFICIENT_LOGON_INFO
//
// MessageText:
//
// There is insufficient account information to log you on.
//
  {$EXTERNALSYM STATUS_INSUFFICIENT_LOGON_INFO}
  STATUS_INSUFFICIENT_LOGON_INFO   =  TNTStatus($C0000250);

//
// MessageId: STATUS_BAD_DLL_ENTRYPOINT
//
// MessageText:
//
// {Invalid DLL Entrypoint}
// The dynamic link library %hs is not written correctly. The stack pointer has been left in an inconsistent state.
// The entrypoint should be declared as WINAPI or STDCALL. Select YES to fail the DLL load. Select NO to continue execution. Selecting NO may cause the application to operate incorrectly.
//
  {$EXTERNALSYM STATUS_BAD_DLL_ENTRYPOINT}
  STATUS_BAD_DLL_ENTRYPOINT        =  TNTStatus($C0000251);

//
// MessageId: STATUS_BAD_SERVICE_ENTRYPOINT
//
// MessageText:
//
// {Invalid Service Callback Entrypoint}
// The %hs service is not written correctly. The stack pointer has been left in an inconsistent state.
// The callback entrypoint should be declared as WINAPI or STDCALL. Selecting OK will cause the service to continue operation. However, the service process may operate incorrectly.
//
  {$EXTERNALSYM STATUS_BAD_SERVICE_ENTRYPOINT}
  STATUS_BAD_SERVICE_ENTRYPOINT    =  TNTStatus($C0000252);

//
// MessageId: STATUS_LPC_REPLY_LOST
//
// MessageText:
//
// The server received the messages but did not send a reply.
//
  {$EXTERNALSYM STATUS_LPC_REPLY_LOST}
  STATUS_LPC_REPLY_LOST            =  TNTStatus($C0000253);

//
// MessageId: STATUS_IP_ADDRESS_CONFLICT1
//
// MessageText:
//
// There is an IP address conflict with another system on the network
//
  {$EXTERNALSYM STATUS_IP_ADDRESS_CONFLICT1}
  STATUS_IP_ADDRESS_CONFLICT1      =  TNTStatus($C0000254);

//
// MessageId: STATUS_IP_ADDRESS_CONFLICT2
//
// MessageText:
//
// There is an IP address conflict with another system on the network
//
  {$EXTERNALSYM STATUS_IP_ADDRESS_CONFLICT2}
  STATUS_IP_ADDRESS_CONFLICT2      =  TNTStatus($C0000255);

//
// MessageId: STATUS_REGISTRY_QUOTA_LIMIT
//
// MessageText:
//
// {Low On Registry Space}
// The system has reached the maximum size allowed for the system part of the registry.  Additional storage requests will be ignored.
//
  {$EXTERNALSYM STATUS_REGISTRY_QUOTA_LIMIT}
  STATUS_REGISTRY_QUOTA_LIMIT      =  TNTStatus($C0000256);

//
// MessageId: STATUS_PATH_NOT_COVERED
//
// MessageText:
//
// The contacted server does not support the indicated part of the DFS namespace.
//
  {$EXTERNALSYM STATUS_PATH_NOT_COVERED}
  STATUS_PATH_NOT_COVERED          =  TNTStatus($C0000257);

//
// MessageId: STATUS_NO_CALLBACK_ACTIVE
//
// MessageText:
//
// A callback return system service cannot be executed when no callback is active.
//
  {$EXTERNALSYM STATUS_NO_CALLBACK_ACTIVE}
  STATUS_NO_CALLBACK_ACTIVE        =  TNTStatus($C0000258);

//
// MessageId: STATUS_LICENSE_QUOTA_EXCEEDED
//
// MessageText:
//
// The service being accessed is licensed for a particular number of connections.
// No more connections can be made to the service at this time because there are already as many connections as the service can accept.
//
  {$EXTERNALSYM STATUS_LICENSE_QUOTA_EXCEEDED}
  STATUS_LICENSE_QUOTA_EXCEEDED    =  TNTStatus($C0000259);

//
// MessageId: STATUS_PWD_TOO_SHORT
//
// MessageText:
//
// The password provided is too short to meet the policy of your user account.
// Please choose a longer password.
//
  {$EXTERNALSYM STATUS_PWD_TOO_SHORT}
  STATUS_PWD_TOO_SHORT             =  TNTStatus($C000025A);

//
// MessageId: STATUS_PWD_TOO_RECENT
//
// MessageText:
//
// The policy of your user account does not allow you to change passwords too frequently.
// This is done to prevent users from changing back to a familiar, but potentially discovered, password.
// If you feel your password has been compromised then please contact your administrator immediately to have a new one assigned.
//
  {$EXTERNALSYM STATUS_PWD_TOO_RECENT}
  STATUS_PWD_TOO_RECENT            =  TNTStatus($C000025B);

//
// MessageId: STATUS_PWD_HISTORY_CONFLICT
//
// MessageText:
//
// You have attempted to change your password to one that you have used in the past.
// The policy of your user account does not allow this. Please select a password that you have not previously used.
//
  {$EXTERNALSYM STATUS_PWD_HISTORY_CONFLICT}
  STATUS_PWD_HISTORY_CONFLICT      =  TNTStatus($C000025C);

//
// MessageId: STATUS_PLUGPLAY_NO_DEVICE
//
// MessageText:
//
// You have attempted to load a legacy device driver while its device instance had been disabled.
//
  {$EXTERNALSYM STATUS_PLUGPLAY_NO_DEVICE}
  STATUS_PLUGPLAY_NO_DEVICE        =  TNTStatus($C000025E);

//
// MessageId: STATUS_UNSUPPORTED_COMPRESSION
//
// MessageText:
//
// The specified compression format is unsupported.
//
  {$EXTERNALSYM STATUS_UNSUPPORTED_COMPRESSION}
  STATUS_UNSUPPORTED_COMPRESSION   =  TNTStatus($C000025F);

//
// MessageId: STATUS_INVALID_HW_PROFILE
//
// MessageText:
//
// The specified hardware profile configuration is invalid.
//
  {$EXTERNALSYM STATUS_INVALID_HW_PROFILE}
  STATUS_INVALID_HW_PROFILE        =  TNTStatus($C0000260);

//
// MessageId: STATUS_INVALID_PLUGPLAY_DEVICE_PATH
//
// MessageText:
//
// The specified Plug and Play registry device path is invalid.
//
  {$EXTERNALSYM STATUS_INVALID_PLUGPLAY_DEVICE_PATH}
  STATUS_INVALID_PLUGPLAY_DEVICE_PATH =  TNTStatus($C0000261);

//
// MessageId: STATUS_DRIVER_ORDINAL_NOT_FOUND
//
// MessageText:
//
// {Driver Entry Point Not Found}
// The %hs device driver could not locate the ordinal %ld in driver %hs.
//
  {$EXTERNALSYM STATUS_DRIVER_ORDINAL_NOT_FOUND}
  STATUS_DRIVER_ORDINAL_NOT_FOUND  =  TNTStatus($C0000262);

//
// MessageId: STATUS_DRIVER_ENTRYPOINT_NOT_FOUND
//
// MessageText:
//
// {Driver Entry Point Not Found}
// The %hs device driver could not locate the entry point %hs in driver %hs.
//
  {$EXTERNALSYM STATUS_DRIVER_ENTRYPOINT_NOT_FOUND}
  STATUS_DRIVER_ENTRYPOINT_NOT_FOUND =  TNTStatus($C0000263);

//
// MessageId: STATUS_RESOURCE_NOT_OWNED
//
// MessageText:
//
// {Application Error}
// The application attempted to release a resource it did not own. Click OK to terminate the application.
//
  {$EXTERNALSYM STATUS_RESOURCE_NOT_OWNED}
  STATUS_RESOURCE_NOT_OWNED        =  TNTStatus($C0000264);

//
// MessageId: STATUS_TOO_MANY_LINKS
//
// MessageText:
//
// An attempt was made to create more links on a file than the file system supports.
//
  {$EXTERNALSYM STATUS_TOO_MANY_LINKS}
  STATUS_TOO_MANY_LINKS            =  TNTStatus($C0000265);

//
// MessageId: STATUS_QUOTA_LIST_INCONSISTENT
//
// MessageText:
//
// The specified quota list is internally inconsistent with its descriptor.
//
  {$EXTERNALSYM STATUS_QUOTA_LIST_INCONSISTENT}
  STATUS_QUOTA_LIST_INCONSISTENT   =  TNTStatus($C0000266);

//
// MessageId: STATUS_FILE_IS_OFFLINE
//
// MessageText:
//
// The specified file has been relocated to offline storage.
//
  {$EXTERNALSYM STATUS_FILE_IS_OFFLINE}
  STATUS_FILE_IS_OFFLINE           =  TNTStatus($C0000267);

//
// MessageId: STATUS_EVALUATION_EXPIRATION
//
// MessageText:
//
// {Windows Evaluation Notification}
// The evaluation period for this installation of Windows has expired. This system will shutdown in 1 hour. To restore access to this installation of Windows, please upgrade this installation using a licensed distribution of this product.
//
  {$EXTERNALSYM STATUS_EVALUATION_EXPIRATION}
  STATUS_EVALUATION_EXPIRATION     =  TNTStatus($C0000268);

//
// MessageId: STATUS_ILLEGAL_DLL_RELOCATION
//
// MessageText:
//
// {Illegal System DLL Relocation}
// The system DLL %hs was relocated in memory. The application will not run properly.
// The relocation occurred because the DLL %hs occupied an address range reserved for Windows system DLLs. The vendor supplying the DLL should be contacted for a new DLL.
//
  {$EXTERNALSYM STATUS_ILLEGAL_DLL_RELOCATION}
  STATUS_ILLEGAL_DLL_RELOCATION    =  TNTStatus($C0000269);

//
// MessageId: STATUS_LICENSE_VIOLATION
//
// MessageText:
//
// {License Violation}
// The system has detected tampering with your registered product type. This is a violation of your software license. Tampering with product type is not permitted.
//
  {$EXTERNALSYM STATUS_LICENSE_VIOLATION}
  STATUS_LICENSE_VIOLATION         =  TNTStatus($C000026A);

//
// MessageId: STATUS_DLL_INIT_FAILED_LOGOFF
//
// MessageText:
//
// {DLL Initialization Failed}
// The application failed to initialize because the window station is shutting down.
//
  {$EXTERNALSYM STATUS_DLL_INIT_FAILED_LOGOFF}
  STATUS_DLL_INIT_FAILED_LOGOFF    =  TNTStatus($C000026B);

//
// MessageId: STATUS_DRIVER_UNABLE_TO_LOAD
//
// MessageText:
//
// {Unable to Load Device Driver}
// %hs device driver could not be loaded.
// Error Status was 0x%x
//
  {$EXTERNALSYM STATUS_DRIVER_UNABLE_TO_LOAD}
  STATUS_DRIVER_UNABLE_TO_LOAD     =  TNTStatus($C000026C);

//
// MessageId: STATUS_DFS_UNAVAILABLE
//
// MessageText:
//
// DFS is unavailable on the contacted server.
//
  {$EXTERNALSYM STATUS_DFS_UNAVAILABLE}
  STATUS_DFS_UNAVAILABLE           =  TNTStatus($C000026D);

//
// MessageId: STATUS_VOLUME_DISMOUNTED
//
// MessageText:
//
// An operation was attempted to a volume after it was dismounted.
//
  {$EXTERNALSYM STATUS_VOLUME_DISMOUNTED}
  STATUS_VOLUME_DISMOUNTED         =  TNTStatus($C000026E);

//
// MessageId: STATUS_WX86_INTERNAL_ERROR
//
// MessageText:
//
// An internal error occurred in the Win32 x86 emulation subsystem.
//
  {$EXTERNALSYM STATUS_WX86_INTERNAL_ERROR}
  STATUS_WX86_INTERNAL_ERROR       =  TNTStatus($C000026F);

//
// MessageId: STATUS_WX86_FLOAT_STACK_CHECK
//
// MessageText:
//
// Win32 x86 emulation subsystem Floating-point stack check.
//
  {$EXTERNALSYM STATUS_WX86_FLOAT_STACK_CHECK}
  STATUS_WX86_FLOAT_STACK_CHECK    =  TNTStatus($C0000270);

//
// MessageId: STATUS_VALIDATE_CONTINUE
//
// MessageText:
//
// The validation process needs to continue on to the next step.
//
  {$EXTERNALSYM STATUS_VALIDATE_CONTINUE}
  STATUS_VALIDATE_CONTINUE         =  TNTStatus($C0000271);

//
// MessageId: STATUS_NO_MATCH
//
// MessageText:
//
// There was no match for the specified key in the index.
//
  {$EXTERNALSYM STATUS_NO_MATCH}
  STATUS_NO_MATCH                  =  TNTStatus($C0000272);

//
// MessageId: STATUS_NO_MORE_MATCHES
//
// MessageText:
//
// There are no more matches for the current index enumeration.
//
  {$EXTERNALSYM STATUS_NO_MORE_MATCHES}
  STATUS_NO_MORE_MATCHES           =  TNTStatus($C0000273);

//
// MessageId: STATUS_NOT_A_REPARSE_POINT
//
// MessageText:
//
// The NTFS file or directory is not a reparse point.
//
  {$EXTERNALSYM STATUS_NOT_A_REPARSE_POINT}
  STATUS_NOT_A_REPARSE_POINT       =  TNTStatus($C0000275);

//
// MessageId: STATUS_IO_REPARSE_TAG_INVALID
//
// MessageText:
//
// The Windows I/O reparse tag passed for the NTFS reparse point is invalid.
//
  {$EXTERNALSYM STATUS_IO_REPARSE_TAG_INVALID}
  STATUS_IO_REPARSE_TAG_INVALID    =  TNTStatus($C0000276);

//
// MessageId: STATUS_IO_REPARSE_TAG_MISMATCH
//
// MessageText:
//
// The Windows I/O reparse tag does not match the one present in the NTFS reparse point.
//
  {$EXTERNALSYM STATUS_IO_REPARSE_TAG_MISMATCH}
  STATUS_IO_REPARSE_TAG_MISMATCH   =  TNTStatus($C0000277);

//
// MessageId: STATUS_IO_REPARSE_DATA_INVALID
//
// MessageText:
//
// The user data passed for the NTFS reparse point is invalid.
//
  {$EXTERNALSYM STATUS_IO_REPARSE_DATA_INVALID}
  STATUS_IO_REPARSE_DATA_INVALID   =  TNTStatus($C0000278);

//
// MessageId: STATUS_IO_REPARSE_TAG_NOT_HANDLED
//
// MessageText:
//
// The layered file system driver for this IO tag did not handle it when needed.
//
  {$EXTERNALSYM STATUS_IO_REPARSE_TAG_NOT_HANDLED}
  STATUS_IO_REPARSE_TAG_NOT_HANDLED =  TNTStatus($C0000279);

//
// MessageId: STATUS_REPARSE_POINT_NOT_RESOLVED
//
// MessageText:
//
// The NTFS symbolic link could not be resolved even though the initial file name is valid.
//
  {$EXTERNALSYM STATUS_REPARSE_POINT_NOT_RESOLVED}
  STATUS_REPARSE_POINT_NOT_RESOLVED =  TNTStatus($C0000280);

//
// MessageId: STATUS_DIRECTORY_IS_A_REPARSE_POINT
//
// MessageText:
//
// The NTFS directory is a reparse point.
//
  {$EXTERNALSYM STATUS_DIRECTORY_IS_A_REPARSE_POINT}
  STATUS_DIRECTORY_IS_A_REPARSE_POINT =  TNTStatus($C0000281);

//
// MessageId: STATUS_RANGE_LIST_CONFLICT
//
// MessageText:
//
// The range could not be added to the range list because of a conflict.
//
  {$EXTERNALSYM STATUS_RANGE_LIST_CONFLICT}
  STATUS_RANGE_LIST_CONFLICT       =  TNTStatus($C0000282);

//
// MessageId: STATUS_SOURCE_ELEMENT_EMPTY
//
// MessageText:
//
// The specified medium changer source element contains no media.
//
  {$EXTERNALSYM STATUS_SOURCE_ELEMENT_EMPTY}
  STATUS_SOURCE_ELEMENT_EMPTY      =  TNTStatus($C0000283);

//
// MessageId: STATUS_DESTINATION_ELEMENT_FULL
//
// MessageText:
//
// The specified medium changer destination element already contains media.
//
  {$EXTERNALSYM STATUS_DESTINATION_ELEMENT_FULL}
  STATUS_DESTINATION_ELEMENT_FULL  =  TNTStatus($C0000284);

//
// MessageId: STATUS_ILLEGAL_ELEMENT_ADDRESS
//
// MessageText:
//
// The specified medium changer element does not exist.
//
  {$EXTERNALSYM STATUS_ILLEGAL_ELEMENT_ADDRESS}
  STATUS_ILLEGAL_ELEMENT_ADDRESS   =  TNTStatus($C0000285);

//
// MessageId: STATUS_MAGAZINE_NOT_PRESENT
//
// MessageText:
//
// The specified element is contained within a magazine that is no longer present.
//
  {$EXTERNALSYM STATUS_MAGAZINE_NOT_PRESENT}
  STATUS_MAGAZINE_NOT_PRESENT      =  TNTStatus($C0000286);

//
// MessageId: STATUS_REINITIALIZATION_NEEDED
//
// MessageText:
//
// The device requires reinitialization due to hardware errors.
//
  {$EXTERNALSYM STATUS_REINITIALIZATION_NEEDED}
  STATUS_REINITIALIZATION_NEEDED   =  TNTStatus($C0000287);

//
// MessageId: STATUS_DEVICE_REQUIRES_CLEANING
//
// MessageText:
//
// The device has indicated that cleaning is necessary.
//
  {$EXTERNALSYM STATUS_DEVICE_REQUIRES_CLEANING}
  STATUS_DEVICE_REQUIRES_CLEANING  =  TNTStatus($80000288);

//
// MessageId: STATUS_DEVICE_DOOR_OPEN
//
// MessageText:
//
// The device has indicated that it's door is open. Further operations require it closed and secured.
//
  {$EXTERNALSYM STATUS_DEVICE_DOOR_OPEN}
  STATUS_DEVICE_DOOR_OPEN          =  TNTStatus($80000289);

//
// MessageId: STATUS_ENCRYPTION_FAILED
//
// MessageText:
//
// The file encryption attempt failed.
//
  {$EXTERNALSYM STATUS_ENCRYPTION_FAILED}
  STATUS_ENCRYPTION_FAILED         =  TNTStatus($C000028A);

//
// MessageId: STATUS_DECRYPTION_FAILED
//
// MessageText:
//
// The file decryption attempt failed.
//
  {$EXTERNALSYM STATUS_DECRYPTION_FAILED}
  STATUS_DECRYPTION_FAILED         =  TNTStatus($C000028B);

//
// MessageId: STATUS_RANGE_NOT_FOUND
//
// MessageText:
//
// The specified range could not be found in the range list.
//
  {$EXTERNALSYM STATUS_RANGE_NOT_FOUND}
  STATUS_RANGE_NOT_FOUND           =  TNTStatus($C000028C);

//
// MessageId: STATUS_NO_RECOVERY_POLICY
//
// MessageText:
//
// There is no encryption recovery policy configured for this system.
//
  {$EXTERNALSYM STATUS_NO_RECOVERY_POLICY}
  STATUS_NO_RECOVERY_POLICY        =  TNTStatus($C000028D);

//
// MessageId: STATUS_NO_EFS
//
// MessageText:
//
// The required encryption driver is not loaded for this system.
//
  {$EXTERNALSYM STATUS_NO_EFS}
  STATUS_NO_EFS                    =  TNTStatus($C000028E);

//
// MessageId: STATUS_WRONG_EFS
//
// MessageText:
//
// The file was encrypted with a different encryption driver than is currently loaded.
//
  {$EXTERNALSYM STATUS_WRONG_EFS}
  STATUS_WRONG_EFS                 =  TNTStatus($C000028F);

//
// MessageId: STATUS_NO_USER_KEYS
//
// MessageText:
//
// There are no EFS keys defined for the user.
//
  {$EXTERNALSYM STATUS_NO_USER_KEYS}
  STATUS_NO_USER_KEYS              =  TNTStatus($C0000290);

//
// MessageId: STATUS_FILE_NOT_ENCRYPTED
//
// MessageText:
//
// The specified file is not encrypted.
//
  {$EXTERNALSYM STATUS_FILE_NOT_ENCRYPTED}
  STATUS_FILE_NOT_ENCRYPTED        =  TNTStatus($C0000291);

//
// MessageId: STATUS_NOT_EXPORT_FORMAT
//
// MessageText:
//
// The specified file is not in the defined EFS export format.
//
  {$EXTERNALSYM STATUS_NOT_EXPORT_FORMAT}
  STATUS_NOT_EXPORT_FORMAT         =  TNTStatus($C0000292);

//
// MessageId: STATUS_FILE_ENCRYPTED
//
// MessageText:
//
// The specified file is encrypted and the user does not have the ability to decrypt it.
//
  {$EXTERNALSYM STATUS_FILE_ENCRYPTED}
  STATUS_FILE_ENCRYPTED            =  TNTStatus($C0000293);

//
// MessageId: STATUS_WAKE_SYSTEM
//
// MessageText:
//
// The system has awoken
//
  {$EXTERNALSYM STATUS_WAKE_SYSTEM}
  STATUS_WAKE_SYSTEM               =  TNTStatus($40000294);

//
// MessageId: STATUS_WMI_GUID_NOT_FOUND
//
// MessageText:
//
// The guid passed was not recognized as valid by a WMI data provider.
//
  {$EXTERNALSYM STATUS_WMI_GUID_NOT_FOUND}
  STATUS_WMI_GUID_NOT_FOUND        =  TNTStatus($C0000295);

//
// MessageId: STATUS_WMI_INSTANCE_NOT_FOUND
//
// MessageText:
//
// The instance name passed was not recognized as valid by a WMI data provider.
//
  {$EXTERNALSYM STATUS_WMI_INSTANCE_NOT_FOUND}
  STATUS_WMI_INSTANCE_NOT_FOUND    =  TNTStatus($C0000296);

//
// MessageId: STATUS_WMI_ITEMID_NOT_FOUND
//
// MessageText:
//
// The data item id passed was not recognized as valid by a WMI data provider.
//
  {$EXTERNALSYM STATUS_WMI_ITEMID_NOT_FOUND}
  STATUS_WMI_ITEMID_NOT_FOUND      =  TNTStatus($C0000297);

//
// MessageId: STATUS_WMI_TRY_AGAIN
//
// MessageText:
//
// The WMI request could not be completed and should be retried.
//
  {$EXTERNALSYM STATUS_WMI_TRY_AGAIN}
  STATUS_WMI_TRY_AGAIN             =  TNTStatus($C0000298);

//
// MessageId: STATUS_SHARED_POLICY
//
// MessageText:
//
// The policy object is shared and can only be modified at the root
//
  {$EXTERNALSYM STATUS_SHARED_POLICY}
  STATUS_SHARED_POLICY             =  TNTStatus($C0000299);

//
// MessageId: STATUS_POLICY_OBJECT_NOT_FOUND
//
// MessageText:
//
// The policy object does not exist when it should
//
  {$EXTERNALSYM STATUS_POLICY_OBJECT_NOT_FOUND}
  STATUS_POLICY_OBJECT_NOT_FOUND   =  TNTStatus($C000029A);

//
// MessageId: STATUS_POLICY_ONLY_IN_DS
//
// MessageText:
//
// The requested policy information only lives in the Ds
//
  {$EXTERNALSYM STATUS_POLICY_ONLY_IN_DS}
  STATUS_POLICY_ONLY_IN_DS         =  TNTStatus($C000029B);

//
// MessageId: STATUS_VOLUME_NOT_UPGRADED
//
// MessageText:
//
// The volume must be upgraded to enable this feature
//
  {$EXTERNALSYM STATUS_VOLUME_NOT_UPGRADED}
  STATUS_VOLUME_NOT_UPGRADED       =  TNTStatus($C000029C);

//
// MessageId: STATUS_REMOTE_STORAGE_NOT_ACTIVE
//
// MessageText:
//
// The remote storage service is not operational at this time.
//
  {$EXTERNALSYM STATUS_REMOTE_STORAGE_NOT_ACTIVE}
  STATUS_REMOTE_STORAGE_NOT_ACTIVE =  TNTStatus($C000029D);

//
// MessageId: STATUS_REMOTE_STORAGE_MEDIA_ERROR
//
// MessageText:
//
// The remote storage service encountered a media error.
//
  {$EXTERNALSYM STATUS_REMOTE_STORAGE_MEDIA_ERROR}
  STATUS_REMOTE_STORAGE_MEDIA_ERROR =  TNTStatus($C000029E);

//
// MessageId: STATUS_NO_TRACKING_SERVICE
//
// MessageText:
//
// The tracking (workstation) service is not running.
//
  {$EXTERNALSYM STATUS_NO_TRACKING_SERVICE}
  STATUS_NO_TRACKING_SERVICE       =  TNTStatus($C000029F);

//
// MessageId: STATUS_SERVER_SID_MISMATCH
//
// MessageText:
//
// The server process is running under a SID different than that required by client.
//
  {$EXTERNALSYM STATUS_SERVER_SID_MISMATCH}
  STATUS_SERVER_SID_MISMATCH       =  TNTStatus($C00002A0);

//
// Directory Service specific Errors
//
//
// MessageId: STATUS_DS_NO_ATTRIBUTE_OR_VALUE
//
// MessageText:
//
// The specified directory service attribute or value does not exist.
//
  {$EXTERNALSYM STATUS_DS_NO_ATTRIBUTE_OR_VALUE}
  STATUS_DS_NO_ATTRIBUTE_OR_VALUE  =  TNTStatus($C00002A1);

//
// MessageId: STATUS_DS_INVALID_ATTRIBUTE_SYNTAX
//
// MessageText:
//
// The attribute syntax specified to the directory service is invalid.
//
  {$EXTERNALSYM STATUS_DS_INVALID_ATTRIBUTE_SYNTAX}
  STATUS_DS_INVALID_ATTRIBUTE_SYNTAX =  TNTStatus($C00002A2);

//
// MessageId: STATUS_DS_ATTRIBUTE_TYPE_UNDEFINED
//
// MessageText:
//
// The attribute type specified to the directory service is not defined.
//
  {$EXTERNALSYM STATUS_DS_ATTRIBUTE_TYPE_UNDEFINED}
  STATUS_DS_ATTRIBUTE_TYPE_UNDEFINED =  TNTStatus($C00002A3);

//
// MessageId: STATUS_DS_ATTRIBUTE_OR_VALUE_EXISTS
//
// MessageText:
//
// The specified directory service attribute or value already exists.
//
  {$EXTERNALSYM STATUS_DS_ATTRIBUTE_OR_VALUE_EXISTS}
  STATUS_DS_ATTRIBUTE_OR_VALUE_EXISTS =  TNTStatus($C00002A4);

//
// MessageId: STATUS_DS_BUSY
//
// MessageText:
//
// The directory service is busy.
//
  {$EXTERNALSYM STATUS_DS_BUSY}
  STATUS_DS_BUSY                   =  TNTStatus($C00002A5);

//
// MessageId: STATUS_DS_UNAVAILABLE
//
// MessageText:
//
// The directory service is not available.
//
  {$EXTERNALSYM STATUS_DS_UNAVAILABLE}
  STATUS_DS_UNAVAILABLE            =  TNTStatus($C00002A6);

//
// MessageId: STATUS_DS_NO_RIDS_ALLOCATED
//
// MessageText:
//
// The directory service was unable to allocate a relative identifier.
//
  {$EXTERNALSYM STATUS_DS_NO_RIDS_ALLOCATED}
  STATUS_DS_NO_RIDS_ALLOCATED      =  TNTStatus($C00002A7);

//
// MessageId: STATUS_DS_NO_MORE_RIDS
//
// MessageText:
//
// The directory service has exhausted the pool of relative identifiers.
//
  {$EXTERNALSYM STATUS_DS_NO_MORE_RIDS}
  STATUS_DS_NO_MORE_RIDS           =  TNTStatus($C00002A8);

//
// MessageId: STATUS_DS_INCORRECT_ROLE_OWNER
//
// MessageText:
//
// The requested operation could not be performed because the directory service is not the master for that type of operation.
//
  {$EXTERNALSYM STATUS_DS_INCORRECT_ROLE_OWNER}
  STATUS_DS_INCORRECT_ROLE_OWNER   =  TNTStatus($C00002A9);

//
// MessageId: STATUS_DS_RIDMGR_INIT_ERROR
//
// MessageText:
//
// The directory service was unable to initialize the subsystem that allocates relative identifiers.
//
  {$EXTERNALSYM STATUS_DS_RIDMGR_INIT_ERROR}
  STATUS_DS_RIDMGR_INIT_ERROR      =  TNTStatus($C00002AA);

//
// MessageId: STATUS_DS_OBJ_CLASS_VIOLATION
//
// MessageText:
//
// The requested operation did not satisfy one or more constraints associated with the class of the object.
//
  {$EXTERNALSYM STATUS_DS_OBJ_CLASS_VIOLATION}
  STATUS_DS_OBJ_CLASS_VIOLATION    =  TNTStatus($C00002AB);

//
// MessageId: STATUS_DS_CANT_ON_NON_LEAF
//
// MessageText:
//
// The directory service can perform the requested operation only on a leaf object.
//
  {$EXTERNALSYM STATUS_DS_CANT_ON_NON_LEAF}
  STATUS_DS_CANT_ON_NON_LEAF       =  TNTStatus($C00002AC);

//
// MessageId: STATUS_DS_CANT_ON_RDN
//
// MessageText:
//
// The directory service cannot perform the requested operation on the Relatively Defined Name (RDN) attribute of an object.
//
  {$EXTERNALSYM STATUS_DS_CANT_ON_RDN}
  STATUS_DS_CANT_ON_RDN            =  TNTStatus($C00002AD);

//
// MessageId: STATUS_DS_CANT_MOD_OBJ_CLASS
//
// MessageText:
//
// The directory service detected an attempt to modify the object class of an object.
//
  {$EXTERNALSYM STATUS_DS_CANT_MOD_OBJ_CLASS}
  STATUS_DS_CANT_MOD_OBJ_CLASS     =  TNTStatus($C00002AE);

//
// MessageId: STATUS_DS_CROSS_DOM_MOVE_FAILED
//
// MessageText:
//
// An error occurred while performing a cross domain move operation.
//
  {$EXTERNALSYM STATUS_DS_CROSS_DOM_MOVE_FAILED}
  STATUS_DS_CROSS_DOM_MOVE_FAILED  =  TNTStatus($C00002AF);

//
// MessageId: STATUS_DS_GC_NOT_AVAILABLE
//
// MessageText:
//
// Unable to Contact the Global Catalog Server.
//
  {$EXTERNALSYM STATUS_DS_GC_NOT_AVAILABLE}
  STATUS_DS_GC_NOT_AVAILABLE       =  TNTStatus($C00002B0);

//
// MessageId: STATUS_DIRECTORY_SERVICE_REQUIRED
//
// MessageText:
//
// The requested operation requires a directory service, and none was available.
//
  {$EXTERNALSYM STATUS_DIRECTORY_SERVICE_REQUIRED}
  STATUS_DIRECTORY_SERVICE_REQUIRED =  TNTStatus($C00002B1);

//
// MessageId: STATUS_REPARSE_ATTRIBUTE_CONFLICT
//
// MessageText:
//
// The reparse attribute cannot be set as it is incompatible with an existing attribute.
//
  {$EXTERNALSYM STATUS_REPARSE_ATTRIBUTE_CONFLICT}
  STATUS_REPARSE_ATTRIBUTE_CONFLICT =  TNTStatus($C00002B2);

//
// MessageId: STATUS_CANT_ENABLE_DENY_ONLY
//
// MessageText:
//
// A group marked use for deny only cannot be enabled.
//
  {$EXTERNALSYM STATUS_CANT_ENABLE_DENY_ONLY}
  STATUS_CANT_ENABLE_DENY_ONLY     =  TNTStatus($C00002B3);

//
// MessageId: STATUS_FLOAT_MULTIPLE_FAULTS
//
// MessageText:
//
// {EXCEPTION}
// Multiple floating point faults.
//
  {$EXTERNALSYM STATUS_FLOAT_MULTIPLE_FAULTS}
  STATUS_FLOAT_MULTIPLE_FAULTS     =  TNTStatus($C00002B4);    // winnt

//
// MessageId: STATUS_FLOAT_MULTIPLE_TRAPS
//
// MessageText:
//
// {EXCEPTION}
// Multiple floating point traps.
//
  {$EXTERNALSYM STATUS_FLOAT_MULTIPLE_TRAPS}
  STATUS_FLOAT_MULTIPLE_TRAPS      =  TNTStatus($C00002B5);    // winnt

//
// MessageId: STATUS_DEVICE_REMOVED
//
// MessageText:
//
// The device has been removed.
//
  {$EXTERNALSYM STATUS_DEVICE_REMOVED}
  STATUS_DEVICE_REMOVED            =  TNTStatus($C00002B6);

//
// MessageId: STATUS_JOURNAL_DELETE_IN_PROGRESS
//
// MessageText:
//
// The volume change journal is being deleted.
//
  {$EXTERNALSYM STATUS_JOURNAL_DELETE_IN_PROGRESS}
  STATUS_JOURNAL_DELETE_IN_PROGRESS =  TNTStatus($C00002B7);

//
// MessageId: STATUS_JOURNAL_NOT_ACTIVE
//
// MessageText:
//
// The volume change journal is not active.
//
  {$EXTERNALSYM STATUS_JOURNAL_NOT_ACTIVE}
  STATUS_JOURNAL_NOT_ACTIVE        =  TNTStatus($C00002B8);

//
// MessageId: STATUS_NOINTERFACE
//
// MessageText:
//
// The requested interface is not supported.
//
  {$EXTERNALSYM STATUS_NOINTERFACE}
  STATUS_NOINTERFACE               =  TNTStatus($C00002B9);

//
// MessageId: STATUS_DS_ADMIN_LIMIT_EXCEEDED
//
// MessageText:
//
// A directory service resource limit has been exceeded.
//
  {$EXTERNALSYM STATUS_DS_ADMIN_LIMIT_EXCEEDED}
  STATUS_DS_ADMIN_LIMIT_EXCEEDED   =  TNTStatus($C00002C1);

//
// MessageId: STATUS_DRIVER_FAILED_SLEEP
//
// MessageText:
//
// {System Standby Failed}
// The driver %hs does not support standby mode. Updating this driver may allow the system to go to standby mode.
//
  {$EXTERNALSYM STATUS_DRIVER_FAILED_SLEEP}
  STATUS_DRIVER_FAILED_SLEEP       =  TNTStatus($C00002C2);

//
// MessageId: STATUS_MUTUAL_AUTHENTICATION_FAILED
//
// MessageText:
//
// Mutual Authentication failed. The server's password is out of date at the domain controller.
//
  {$EXTERNALSYM STATUS_MUTUAL_AUTHENTICATION_FAILED}
  STATUS_MUTUAL_AUTHENTICATION_FAILED =  TNTStatus($C00002C3);

//
// MessageId: STATUS_CORRUPT_SYSTEM_FILE
//
// MessageText:
//
// The system file %1 has become corrupt and has been replaced.
//
  {$EXTERNALSYM STATUS_CORRUPT_SYSTEM_FILE}
  STATUS_CORRUPT_SYSTEM_FILE       =  TNTStatus($C00002C4);

//
// MessageId: STATUS_DATATYPE_MISALIGNMENT_ERROR
//
// MessageText:
//
// {EXCEPTION}
// Alignment Error
// A datatype misalignment error was detected in a load or store instruction.
//
  {$EXTERNALSYM STATUS_DATATYPE_MISALIGNMENT_ERROR}
  STATUS_DATATYPE_MISALIGNMENT_ERROR =  TNTStatus($C00002C5);

//
// MessageId: STATUS_WMI_READ_ONLY
//
// MessageText:
//
// The WMI data item or data block is read only.
//
  {$EXTERNALSYM STATUS_WMI_READ_ONLY}
  STATUS_WMI_READ_ONLY             =  TNTStatus($C00002C6);

//
// MessageId: STATUS_WMI_SET_FAILURE
//
// MessageText:
//
// The WMI data item or data block could not be changed.
//
  {$EXTERNALSYM STATUS_WMI_SET_FAILURE}
  STATUS_WMI_SET_FAILURE           =  TNTStatus($C00002C7);

//
// MessageId: STATUS_COMMITMENT_MINIMUM
//
// MessageText:
//
// {Virtual Memory Minimum Too Low}
// Your system is low on virtual memory. Windows is increasing the size of your virtual memory paging file.
// During this process, memory requests for some applications may be denied. For more information, see Help.
//
  {$EXTERNALSYM STATUS_COMMITMENT_MINIMUM}
  STATUS_COMMITMENT_MINIMUM        =  TNTStatus($C00002C8);

//
// MessageId: STATUS_REG_NAT_CONSUMPTION
//
// MessageText:
//
// {EXCEPTION}
// Register NaT consumption faults.
// A NaT value is consumed on a non speculative instruction.
//
  {$EXTERNALSYM STATUS_REG_NAT_CONSUMPTION}
  STATUS_REG_NAT_CONSUMPTION       =  TNTStatus($C00002C9);    // winnt

//
// MessageId: STATUS_TRANSPORT_FULL
//
// MessageText:
//
// The medium changer's transport element contains media, which is causing the operation to fail.
//
  {$EXTERNALSYM STATUS_TRANSPORT_FULL}
  STATUS_TRANSPORT_FULL            =  TNTStatus($C00002CA);

//
// MessageId: STATUS_DS_SAM_INIT_FAILURE
//
// MessageText:
//
// Security Accounts Manager initialization failed because of the following error:
// %hs
// Error Status: 0x%x.
// Please click OK to shutdown this system and reboot into Directory Services Restore Mode, check the event log for more detailed information.
//
  {$EXTERNALSYM STATUS_DS_SAM_INIT_FAILURE}
  STATUS_DS_SAM_INIT_FAILURE       =  TNTStatus($C00002CB);

//
// MessageId: STATUS_ONLY_IF_CONNECTED
//
// MessageText:
//
// This operation is supported only when you are connected to the server.
//
  {$EXTERNALSYM STATUS_ONLY_IF_CONNECTED}
  STATUS_ONLY_IF_CONNECTED         =  TNTStatus($C00002CC);

//
// MessageId: STATUS_DS_SENSITIVE_GROUP_VIOLATION
//
// MessageText:
//
// Only an administrator can modify the membership list of an administrative group.
//
  {$EXTERNALSYM STATUS_DS_SENSITIVE_GROUP_VIOLATION}
  STATUS_DS_SENSITIVE_GROUP_VIOLATION =  TNTStatus($C00002CD);

//
// MessageId: STATUS_PNP_RESTART_ENUMERATION
//
// MessageText:
//
// A device was removed so enumeration must be restarted.
//
  {$EXTERNALSYM STATUS_PNP_RESTART_ENUMERATION}
  STATUS_PNP_RESTART_ENUMERATION   =  TNTStatus($C00002CE);

//
// MessageId: STATUS_JOURNAL_ENTRY_DELETED
//
// MessageText:
//
// The journal entry has been deleted from the journal.
//
  {$EXTERNALSYM STATUS_JOURNAL_ENTRY_DELETED}
  STATUS_JOURNAL_ENTRY_DELETED     =  TNTStatus($C00002CF);

//
// MessageId: STATUS_DS_CANT_MOD_PRIMARYGROUPID
//
// MessageText:
//
// Cannot change the primary group ID of a domain controller account.
//
  {$EXTERNALSYM STATUS_DS_CANT_MOD_PRIMARYGROUPID}
  STATUS_DS_CANT_MOD_PRIMARYGROUPID =  TNTStatus($C00002D0);

//
// MessageId: STATUS_SYSTEM_IMAGE_BAD_SIGNATURE
//
// MessageText:
//
// {Fatal System Error}
// The system image %s is not properly signed.
// The file has been replaced with the signed file.
// The system has been shut down.
//
  {$EXTERNALSYM STATUS_SYSTEM_IMAGE_BAD_SIGNATURE}
  STATUS_SYSTEM_IMAGE_BAD_SIGNATURE =  TNTStatus($C00002D1);

//
// MessageId: STATUS_PNP_REBOOT_REQUIRED
//
// MessageText:
//
// Device will not start without a reboot.
//
  {$EXTERNALSYM STATUS_PNP_REBOOT_REQUIRED}
  STATUS_PNP_REBOOT_REQUIRED       =  TNTStatus($C00002D2);

//
// MessageId: STATUS_POWER_STATE_INVALID
//
// MessageText:
//
// Current device power state cannot support this request.
//
  {$EXTERNALSYM STATUS_POWER_STATE_INVALID}
  STATUS_POWER_STATE_INVALID       =  TNTStatus($C00002D3);

//
// MessageId: STATUS_DS_INVALID_GROUP_TYPE
//
// MessageText:
//
// The specified group type is invalid.
//
  {$EXTERNALSYM STATUS_DS_INVALID_GROUP_TYPE}
  STATUS_DS_INVALID_GROUP_TYPE     =  TNTStatus($C00002D4);

//
// MessageId: STATUS_DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN
//
// MessageText:
//
// In mixed domain no nesting of global group if group is security enabled.
//
  {$EXTERNALSYM STATUS_DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN}
  STATUS_DS_NO_NEST_GLOBALGROUP_IN_MIXEDDOMAIN =  TNTStatus($C00002D5);

//
// MessageId: STATUS_DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN
//
// MessageText:
//
// In mixed domain, cannot nest local groups with other local groups, if the group is security enabled.
//
  {$EXTERNALSYM STATUS_DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN}
  STATUS_DS_NO_NEST_LOCALGROUP_IN_MIXEDDOMAIN =  TNTStatus($C00002D6);

//
// MessageId: STATUS_DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER
//
// MessageText:
//
// A global group cannot have a local group as a member.
//
  {$EXTERNALSYM STATUS_DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER}
  STATUS_DS_GLOBAL_CANT_HAVE_LOCAL_MEMBER =  TNTStatus($C00002D7);

//
// MessageId: STATUS_DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER
//
// MessageText:
//
// A global group cannot have a universal group as a member.
//
  {$EXTERNALSYM STATUS_DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER}
  STATUS_DS_GLOBAL_CANT_HAVE_UNIVERSAL_MEMBER =  TNTStatus($C00002D8);

//
// MessageId: STATUS_DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER
//
// MessageText:
//
// A universal group cannot have a local group as a member.
//
  {$EXTERNALSYM STATUS_DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER}
  STATUS_DS_UNIVERSAL_CANT_HAVE_LOCAL_MEMBER =  TNTStatus($C00002D9);

//
// MessageId: STATUS_DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER
//
// MessageText:
//
// A global group cannot have a cross domain member.
//
  {$EXTERNALSYM STATUS_DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER}
  STATUS_DS_GLOBAL_CANT_HAVE_CROSSDOMAIN_MEMBER =  TNTStatus($C00002DA);

//
// MessageId: STATUS_DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER
//
// MessageText:
//
// A local group cannot have another cross domain local group as a member.
//
  {$EXTERNALSYM STATUS_DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER}
  STATUS_DS_LOCAL_CANT_HAVE_CROSSDOMAIN_LOCAL_MEMBER =  TNTStatus($C00002DB);

//
// MessageId: STATUS_DS_HAVE_PRIMARY_MEMBERS
//
// MessageText:
//
// Cannot change to security disabled group because of having primary members in this group.
//
  {$EXTERNALSYM STATUS_DS_HAVE_PRIMARY_MEMBERS}
  STATUS_DS_HAVE_PRIMARY_MEMBERS   =  TNTStatus($C00002DC);

//
// MessageId: STATUS_WMI_NOT_SUPPORTED
//
// MessageText:
//
// The WMI operation is not supported by the data block or method.
//
  {$EXTERNALSYM STATUS_WMI_NOT_SUPPORTED}
  STATUS_WMI_NOT_SUPPORTED         =  TNTStatus($C00002DD);

//
// MessageId: STATUS_INSUFFICIENT_POWER
//
// MessageText:
//
// There is not enough power to complete the requested operation.
//
  {$EXTERNALSYM STATUS_INSUFFICIENT_POWER}
  STATUS_INSUFFICIENT_POWER        =  TNTStatus($C00002DE);

//
// MessageId: STATUS_SAM_NEED_BOOTKEY_PASSWORD
//
// MessageText:
//
// Security Account Manager needs to get the boot password.
//
  {$EXTERNALSYM STATUS_SAM_NEED_BOOTKEY_PASSWORD}
  STATUS_SAM_NEED_BOOTKEY_PASSWORD =  TNTStatus($C00002DF);

//
// MessageId: STATUS_SAM_NEED_BOOTKEY_FLOPPY
//
// MessageText:
//
// Security Account Manager needs to get the boot key from floppy disk.
//
  {$EXTERNALSYM STATUS_SAM_NEED_BOOTKEY_FLOPPY}
  STATUS_SAM_NEED_BOOTKEY_FLOPPY   =  TNTStatus($C00002E0);

//
// MessageId: STATUS_DS_CANT_START
//
// MessageText:
//
// Directory Service cannot start.
//
  {$EXTERNALSYM STATUS_DS_CANT_START}
  STATUS_DS_CANT_START             =  TNTStatus($C00002E1);

//
// MessageId: STATUS_DS_INIT_FAILURE
//
// MessageText:
//
// Directory Services could not start because of the following error:
// %hs
// Error Status: 0x%x.
// Please click OK to shutdown this system and reboot into Directory Services Restore Mode, check the event log for more detailed information.
//
  {$EXTERNALSYM STATUS_DS_INIT_FAILURE}
  STATUS_DS_INIT_FAILURE           =  TNTStatus($C00002E2);

//
// MessageId: STATUS_SAM_INIT_FAILURE
//
// MessageText:
//
// Security Accounts Manager initialization failed because of the following error:
// %hs
// Error Status: 0x%x.
// Please click OK to shutdown this system and reboot into Safe Mode, check the event log for more detailed information.
//
  {$EXTERNALSYM STATUS_SAM_INIT_FAILURE}
  STATUS_SAM_INIT_FAILURE          =  TNTStatus($C00002E3);

//
// MessageId: STATUS_DS_GC_REQUIRED
//
// MessageText:
//
// The requested operation can be performed only on a global catalog server.
//
  {$EXTERNALSYM STATUS_DS_GC_REQUIRED}
  STATUS_DS_GC_REQUIRED            =  TNTStatus($C00002E4);

//
// MessageId: STATUS_DS_LOCAL_MEMBER_OF_LOCAL_ONLY
//
// MessageText:
//
// A local group can only be a member of other local groups in the same domain.
//
  {$EXTERNALSYM STATUS_DS_LOCAL_MEMBER_OF_LOCAL_ONLY}
  STATUS_DS_LOCAL_MEMBER_OF_LOCAL_ONLY =  TNTStatus($C00002E5);

//
// MessageId: STATUS_DS_NO_FPO_IN_UNIVERSAL_GROUPS
//
// MessageText:
//
// Foreign security principals cannot be members of universal groups.
//
  {$EXTERNALSYM STATUS_DS_NO_FPO_IN_UNIVERSAL_GROUPS}
  STATUS_DS_NO_FPO_IN_UNIVERSAL_GROUPS =  TNTStatus($C00002E6);

//
// MessageId: STATUS_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED
//
// MessageText:
//
// Your computer could not be joined to the domain. You have exceeded the maximum number of computer accounts you are allowed to create in this domain. Contact your system administrator to have this limit reset or increased.
//
  {$EXTERNALSYM STATUS_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED}
  STATUS_DS_MACHINE_ACCOUNT_QUOTA_EXCEEDED =  TNTStatus($C00002E7);

//
// MessageId: STATUS_MULTIPLE_FAULT_VIOLATION
//
// MessageText:
//
//  STATUS_MULTIPLE_FAULT_VIOLATION
//
  {$EXTERNALSYM STATUS_MULTIPLE_FAULT_VIOLATION}
  STATUS_MULTIPLE_FAULT_VIOLATION  =  TNTStatus($C00002E8);

//
// MessageId: STATUS_CURRENT_DOMAIN_NOT_ALLOWED
//
// MessageText:
//
// This operation cannot be performed on the current domain.
//
  {$EXTERNALSYM STATUS_CURRENT_DOMAIN_NOT_ALLOWED}
  STATUS_CURRENT_DOMAIN_NOT_ALLOWED =  TNTStatus($C00002E9);

//
// MessageId: STATUS_CANNOT_MAKE
//
// MessageText:
//
// The directory or file cannot be created.
//
  {$EXTERNALSYM STATUS_CANNOT_MAKE}
  STATUS_CANNOT_MAKE               =  TNTStatus($C00002EA);

//
// MessageId: STATUS_SYSTEM_SHUTDOWN
//
// MessageText:
//
// The system is in the process of shutting down.
//
  {$EXTERNALSYM STATUS_SYSTEM_SHUTDOWN}
  STATUS_SYSTEM_SHUTDOWN           =  TNTStatus($C00002EB);

//
// MessageId: STATUS_DS_INIT_FAILURE_CONSOLE
//
// MessageText:
//
// Directory Services could not start because of the following error:
// %hs
// Error Status: 0x%x.
// Please click OK to shutdown the system. You can use the recovery console to diagnose the system further.
//
  {$EXTERNALSYM STATUS_DS_INIT_FAILURE_CONSOLE}
  STATUS_DS_INIT_FAILURE_CONSOLE   =  TNTStatus($C00002EC);

//
// MessageId: STATUS_DS_SAM_INIT_FAILURE_CONSOLE
//
// MessageText:
//
// Security Accounts Manager initialization failed because of the following error:
// %hs
// Error Status: 0x%x.
// Please click OK to shutdown the system. You can use the recovery console to diagnose the system further.
//
  {$EXTERNALSYM STATUS_DS_SAM_INIT_FAILURE_CONSOLE}
  STATUS_DS_SAM_INIT_FAILURE_CONSOLE =  TNTStatus($C00002ED);

//
// MessageId: STATUS_UNFINISHED_CONTEXT_DELETED
//
// MessageText:
//
// A security context was deleted before the context was completed.  This is considered a logon failure.
//
  {$EXTERNALSYM STATUS_UNFINISHED_CONTEXT_DELETED}
  STATUS_UNFINISHED_CONTEXT_DELETED =  TNTStatus($C00002EE);

//
// MessageId: STATUS_NO_TGT_REPLY
//
// MessageText:
//
// The client is trying to negotiate a context and the server requires user-to-user but didn't send a TGT reply.
//
  {$EXTERNALSYM STATUS_NO_TGT_REPLY}
  STATUS_NO_TGT_REPLY              =  TNTStatus($C00002EF);

//
// MessageId: STATUS_OBJECTID_NOT_FOUND
//
// MessageText:
//
// An object ID was not found in the file.
//
  {$EXTERNALSYM STATUS_OBJECTID_NOT_FOUND}
  STATUS_OBJECTID_NOT_FOUND        =  TNTStatus($C00002F0);

//
// MessageId: STATUS_NO_IP_ADDRESSES
//
// MessageText:
//
// Unable to accomplish the requested task because the local machine does not have any IP addresses.
//
  {$EXTERNALSYM STATUS_NO_IP_ADDRESSES}
  STATUS_NO_IP_ADDRESSES           =  TNTStatus($C00002F1);

//
// MessageId: STATUS_WRONG_CREDENTIAL_HANDLE
//
// MessageText:
//
// The supplied credential handle does not match the credential associated with the security context.
//
  {$EXTERNALSYM STATUS_WRONG_CREDENTIAL_HANDLE}
  STATUS_WRONG_CREDENTIAL_HANDLE   =  TNTStatus($C00002F2);

//
// MessageId: STATUS_CRYPTO_SYSTEM_INVALID
//
// MessageText:
//
// The crypto system or checksum function is invalid because a required function is unavailable.
//
  {$EXTERNALSYM STATUS_CRYPTO_SYSTEM_INVALID}
  STATUS_CRYPTO_SYSTEM_INVALID     =  TNTStatus($C00002F3);

//
// MessageId: STATUS_MAX_REFERRALS_EXCEEDED
//
// MessageText:
//
// The number of maximum ticket referrals has been exceeded.
//
  {$EXTERNALSYM STATUS_MAX_REFERRALS_EXCEEDED}
  STATUS_MAX_REFERRALS_EXCEEDED    =  TNTStatus($C00002F4);

//
// MessageId: STATUS_MUST_BE_KDC
//
// MessageText:
//
// The local machine must be a Kerberos KDC (domain controller) and it is not.
//
  {$EXTERNALSYM STATUS_MUST_BE_KDC}
  STATUS_MUST_BE_KDC               =  TNTStatus($C00002F5);

//
// MessageId: STATUS_STRONG_CRYPTO_NOT_SUPPORTED
//
// MessageText:
//
// The other end of the security negotiation is requires strong crypto but it is not supported on the local machine.
//
  {$EXTERNALSYM STATUS_STRONG_CRYPTO_NOT_SUPPORTED}
  STATUS_STRONG_CRYPTO_NOT_SUPPORTED =  TNTStatus($C00002F6);

//
// MessageId: STATUS_TOO_MANY_PRINCIPALS
//
// MessageText:
//
// The KDC reply contained more than one principal name.
//
  {$EXTERNALSYM STATUS_TOO_MANY_PRINCIPALS}
  STATUS_TOO_MANY_PRINCIPALS       =  TNTStatus($C00002F7);

//
// MessageId: STATUS_NO_PA_DATA
//
// MessageText:
//
// Expected to find PA data for a hint of what etype to use, but it was not found.
//
  {$EXTERNALSYM STATUS_NO_PA_DATA}
  STATUS_NO_PA_DATA                =  TNTStatus($C00002F8);

//
// MessageId: STATUS_PKINIT_NAME_MISMATCH
//
// MessageText:
//
// The client certificate does not contain a valid UPN, or does not match the client name
// in the logon request.  Please contact your administrator.
//
  {$EXTERNALSYM STATUS_PKINIT_NAME_MISMATCH}
  STATUS_PKINIT_NAME_MISMATCH      =  TNTStatus($C00002F9);

//
// MessageId: STATUS_SMARTCARD_LOGON_REQUIRED
//
// MessageText:
//
// Smartcard logon is required and was not used.
//
  {$EXTERNALSYM STATUS_SMARTCARD_LOGON_REQUIRED}
  STATUS_SMARTCARD_LOGON_REQUIRED  =  TNTStatus($C00002FA);

//
// MessageId: STATUS_KDC_INVALID_REQUEST
//
// MessageText:
//
// An invalid request was sent to the KDC.
//
  {$EXTERNALSYM STATUS_KDC_INVALID_REQUEST}
  STATUS_KDC_INVALID_REQUEST       =  TNTStatus($C00002FB);

//
// MessageId: STATUS_KDC_UNABLE_TO_REFER
//
// MessageText:
//
// The KDC was unable to generate a referral for the service requested.
//
  {$EXTERNALSYM STATUS_KDC_UNABLE_TO_REFER}
  STATUS_KDC_UNABLE_TO_REFER       =  TNTStatus($C00002FC);

//
// MessageId: STATUS_KDC_UNKNOWN_ETYPE
//
// MessageText:
//
// The encryption type requested is not supported by the KDC.
//
  {$EXTERNALSYM STATUS_KDC_UNKNOWN_ETYPE}
  STATUS_KDC_UNKNOWN_ETYPE         =  TNTStatus($C00002FD);

//
// MessageId: STATUS_SHUTDOWN_IN_PROGRESS
//
// MessageText:
//
// A system shutdown is in progress.
//
  {$EXTERNALSYM STATUS_SHUTDOWN_IN_PROGRESS}
  STATUS_SHUTDOWN_IN_PROGRESS      =  TNTStatus($C00002FE);

//
// MessageId: STATUS_SERVER_SHUTDOWN_IN_PROGRESS
//
// MessageText:
//
// The server machine is shutting down.
//
  {$EXTERNALSYM STATUS_SERVER_SHUTDOWN_IN_PROGRESS}
  STATUS_SERVER_SHUTDOWN_IN_PROGRESS =  TNTStatus($C00002FF);

//
// MessageId: STATUS_NOT_SUPPORTED_ON_SBS
//
// MessageText:
//
// This operation is not supported on a computer running Windows Server 2003 for Small Business Server
//
  {$EXTERNALSYM STATUS_NOT_SUPPORTED_ON_SBS}
  STATUS_NOT_SUPPORTED_ON_SBS      =  TNTStatus($C0000300);

//
// MessageId: STATUS_WMI_GUID_DISCONNECTED
//
// MessageText:
//
// The WMI GUID is no longer available
//
  {$EXTERNALSYM STATUS_WMI_GUID_DISCONNECTED}
  STATUS_WMI_GUID_DISCONNECTED     =  TNTStatus($C0000301);

//
// MessageId: STATUS_WMI_ALREADY_DISABLED
//
// MessageText:
//
// Collection or events for the WMI GUID is already disabled.
//
  {$EXTERNALSYM STATUS_WMI_ALREADY_DISABLED}
  STATUS_WMI_ALREADY_DISABLED      =  TNTStatus($C0000302);

//
// MessageId: STATUS_WMI_ALREADY_ENABLED
//
// MessageText:
//
// Collection or events for the WMI GUID is already enabled.
//
  {$EXTERNALSYM STATUS_WMI_ALREADY_ENABLED}
  STATUS_WMI_ALREADY_ENABLED       =  TNTStatus($C0000303);

//
// MessageId: STATUS_MFT_TOO_FRAGMENTED
//
// MessageText:
//
// The Master File Table on the volume is too fragmented to complete this operation.
//
  {$EXTERNALSYM STATUS_MFT_TOO_FRAGMENTED}
  STATUS_MFT_TOO_FRAGMENTED        =  TNTStatus($C0000304);

//
// MessageId: STATUS_COPY_PROTECTION_FAILURE
//
// MessageText:
//
// Copy protection failure.
//
  {$EXTERNALSYM STATUS_COPY_PROTECTION_FAILURE}
  STATUS_COPY_PROTECTION_FAILURE   =  TNTStatus($C0000305);

//
// MessageId: STATUS_CSS_AUTHENTICATION_FAILURE
//
// MessageText:
//
// Copy protection error - DVD CSS Authentication failed.
//
  {$EXTERNALSYM STATUS_CSS_AUTHENTICATION_FAILURE}
  STATUS_CSS_AUTHENTICATION_FAILURE =  TNTStatus($C0000306);

//
// MessageId: STATUS_CSS_KEY_NOT_PRESENT
//
// MessageText:
//
// Copy protection error - The given sector does not contain a valid key.
//
  {$EXTERNALSYM STATUS_CSS_KEY_NOT_PRESENT}
  STATUS_CSS_KEY_NOT_PRESENT       =  TNTStatus($C0000307);

//
// MessageId: STATUS_CSS_KEY_NOT_ESTABLISHED
//
// MessageText:
//
// Copy protection error - DVD session key not established.
//
  {$EXTERNALSYM STATUS_CSS_KEY_NOT_ESTABLISHED}
  STATUS_CSS_KEY_NOT_ESTABLISHED   =  TNTStatus($C0000308);

//
// MessageId: STATUS_CSS_SCRAMBLED_SECTOR
//
// MessageText:
//
// Copy protection error - The read failed because the sector is encrypted.
//
  {$EXTERNALSYM STATUS_CSS_SCRAMBLED_SECTOR}
  STATUS_CSS_SCRAMBLED_SECTOR      =  TNTStatus($C0000309);

//
// MessageId: STATUS_CSS_REGION_MISMATCH
//
// MessageText:
//
// Copy protection error - The given DVD's region does not correspond to the
// region setting of the drive.
//
  {$EXTERNALSYM STATUS_CSS_REGION_MISMATCH}
  STATUS_CSS_REGION_MISMATCH       =  TNTStatus($C000030A);

//
// MessageId: STATUS_CSS_RESETS_EXHAUSTED
//
// MessageText:
//
// Copy protection error - The drive's region setting may be permanent.
//
  {$EXTERNALSYM STATUS_CSS_RESETS_EXHAUSTED}
  STATUS_CSS_RESETS_EXHAUSTED      =  TNTStatus($C000030B);

(*++

 MessageId's 0x030c - 0x031f (inclusive) are reserved for future **STORAGE**
 copy protection errors.

--*)
//
// MessageId: STATUS_PKINIT_FAILURE
//
// MessageText:
//
// The kerberos protocol encountered an error while validating the KDC certificate during smartcard Logon.  There
// is more information in the system event log.
//
  {$EXTERNALSYM STATUS_PKINIT_FAILURE}
  STATUS_PKINIT_FAILURE            =  TNTStatus($C0000320);

//
// MessageId: STATUS_SMARTCARD_SUBSYSTEM_FAILURE
//
// MessageText:
//
// The kerberos protocol encountered an error while attempting to utilize the smartcard subsystem.
//
  {$EXTERNALSYM STATUS_SMARTCARD_SUBSYSTEM_FAILURE}
  STATUS_SMARTCARD_SUBSYSTEM_FAILURE =  TNTStatus($C0000321);

//
// MessageId: STATUS_NO_KERB_KEY
//
// MessageText:
//
// The target server does not have acceptable kerberos credentials.
//
  {$EXTERNALSYM STATUS_NO_KERB_KEY}
  STATUS_NO_KERB_KEY               =  TNTStatus($C0000322);

(*++

 MessageId's 0x0323 - 0x034f (inclusive) are reserved for other future copy
 protection errors.

--*)
//
// MessageId: STATUS_HOST_DOWN
//
// MessageText:
//
// The transport determined that the remote system is down.
//
  {$EXTERNALSYM STATUS_HOST_DOWN}
  STATUS_HOST_DOWN                 =  TNTStatus($C0000350);

//
// MessageId: STATUS_UNSUPPORTED_PREAUTH
//
// MessageText:
//
// An unsupported preauthentication mechanism was presented to the kerberos package.
//
  {$EXTERNALSYM STATUS_UNSUPPORTED_PREAUTH}
  STATUS_UNSUPPORTED_PREAUTH       =  TNTStatus($C0000351);

//
// MessageId: STATUS_EFS_ALG_BLOB_TOO_BIG
//
// MessageText:
//
// The encryption algorithm used on the source file needs a bigger key buffer than the one used on the destination file.
//
  {$EXTERNALSYM STATUS_EFS_ALG_BLOB_TOO_BIG}
  STATUS_EFS_ALG_BLOB_TOO_BIG      =  TNTStatus($C0000352);

//
// MessageId: STATUS_PORT_NOT_SET
//
// MessageText:
//
// An attempt to remove a processes DebugPort was made, but a port was not already associated with the process.
//
  {$EXTERNALSYM STATUS_PORT_NOT_SET}
  STATUS_PORT_NOT_SET              =  TNTStatus($C0000353);

//
// MessageId: STATUS_DEBUGGER_INACTIVE
//
// MessageText:
//
// An attempt to do an operation on a debug port failed because the port is in the process of being deleted.
//
  {$EXTERNALSYM STATUS_DEBUGGER_INACTIVE}
  STATUS_DEBUGGER_INACTIVE         =  TNTStatus($C0000354);

//
// MessageId: STATUS_DS_VERSION_CHECK_FAILURE
//
// MessageText:
//
// This version of Windows is not compatible with the behavior version of directory forest, domain or domain controller.
//
  {$EXTERNALSYM STATUS_DS_VERSION_CHECK_FAILURE}
  STATUS_DS_VERSION_CHECK_FAILURE  =  TNTStatus($C0000355);

//
// MessageId: STATUS_AUDITING_DISABLED
//
// MessageText:
//
// The specified event is currently not being audited.
//
  {$EXTERNALSYM STATUS_AUDITING_DISABLED}
  STATUS_AUDITING_DISABLED         =  TNTStatus($C0000356);

//
// MessageId: STATUS_PRENT4_MACHINE_ACCOUNT
//
// MessageText:
//
// The machine account was created pre-NT4.  The account needs to be recreated.
//
  {$EXTERNALSYM STATUS_PRENT4_MACHINE_ACCOUNT}
  STATUS_PRENT4_MACHINE_ACCOUNT    =  TNTStatus($C0000357);

//
// MessageId: STATUS_DS_AG_CANT_HAVE_UNIVERSAL_MEMBER
//
// MessageText:
//
// A account group cannot have a universal group as a member.
//
  {$EXTERNALSYM STATUS_DS_AG_CANT_HAVE_UNIVERSAL_MEMBER}
  STATUS_DS_AG_CANT_HAVE_UNIVERSAL_MEMBER =  TNTStatus($C0000358);

//
// MessageId: STATUS_INVALID_IMAGE_WIN_32
//
// MessageText:
//
// The specified image file did not have the correct format, it appears to be a 32-bit Windows image.
//
  {$EXTERNALSYM STATUS_INVALID_IMAGE_WIN_32}
  STATUS_INVALID_IMAGE_WIN_32      =  TNTStatus($C0000359);

//
// MessageId: STATUS_INVALID_IMAGE_WIN_64
//
// MessageText:
//
// The specified image file did not have the correct format, it appears to be a 64-bit Windows image.
//
  {$EXTERNALSYM STATUS_INVALID_IMAGE_WIN_64}
  STATUS_INVALID_IMAGE_WIN_64      =  TNTStatus($C000035A);

//
// MessageId: STATUS_BAD_BINDINGS
//
// MessageText:
//
// Client's supplied SSPI channel bindings were incorrect.
//
  {$EXTERNALSYM STATUS_BAD_BINDINGS}
  STATUS_BAD_BINDINGS              =  TNTStatus($C000035B);

//
// MessageId: STATUS_NETWORK_SESSION_EXPIRED
//
// MessageText:
//
// The client's session has expired, so the client must reauthenticate to continue accessing the remote resources.
//
  {$EXTERNALSYM STATUS_NETWORK_SESSION_EXPIRED}
  STATUS_NETWORK_SESSION_EXPIRED   =  TNTStatus($C000035C);

//
// MessageId: STATUS_APPHELP_BLOCK
//
// MessageText:
//
// AppHelp dialog canceled thus preventing the application from starting.
//
  {$EXTERNALSYM STATUS_APPHELP_BLOCK}
  STATUS_APPHELP_BLOCK             =  TNTStatus($C000035D);

//
// MessageId: STATUS_ALL_SIDS_FILTERED
//
// MessageText:
//
// The SID filtering operation removed all SIDs.
//
  {$EXTERNALSYM STATUS_ALL_SIDS_FILTERED}
  STATUS_ALL_SIDS_FILTERED         =  TNTStatus($C000035E);

//
// MessageId: STATUS_NOT_SAFE_MODE_DRIVER
//
// MessageText:
//
// The driver was not loaded because the system is booting into safe mode.
//
  {$EXTERNALSYM STATUS_NOT_SAFE_MODE_DRIVER}
  STATUS_NOT_SAFE_MODE_DRIVER      =  TNTStatus($C000035F);

//
// MessageId: STATUS_ACCESS_DISABLED_BY_POLICY_DEFAULT
//
// MessageText:
//
// Access to %1 has been restricted by your Administrator by the default software restriction policy level.
//
  {$EXTERNALSYM STATUS_ACCESS_DISABLED_BY_POLICY_DEFAULT}
  STATUS_ACCESS_DISABLED_BY_POLICY_DEFAULT =  TNTStatus($C0000361);

//
// MessageId: STATUS_ACCESS_DISABLED_BY_POLICY_PATH
//
// MessageText:
//
// Access to %1 has been restricted by your Administrator by location with policy rule %2 placed on path %3
//
  {$EXTERNALSYM STATUS_ACCESS_DISABLED_BY_POLICY_PATH}
  STATUS_ACCESS_DISABLED_BY_POLICY_PATH =  TNTStatus($C0000362);

//
// MessageId: STATUS_ACCESS_DISABLED_BY_POLICY_PUBLISHER
//
// MessageText:
//
// Access to %1 has been restricted by your Administrator by software publisher policy.
//
  {$EXTERNALSYM STATUS_ACCESS_DISABLED_BY_POLICY_PUBLISHER}
  STATUS_ACCESS_DISABLED_BY_POLICY_PUBLISHER =  TNTStatus($C0000363);

//
// MessageId: STATUS_ACCESS_DISABLED_BY_POLICY_OTHER
//
// MessageText:
//
// Access to %1 has been restricted by your Administrator by policy rule %2.
//
  {$EXTERNALSYM STATUS_ACCESS_DISABLED_BY_POLICY_OTHER}
  STATUS_ACCESS_DISABLED_BY_POLICY_OTHER =  TNTStatus($C0000364);

//
// MessageId: STATUS_FAILED_DRIVER_ENTRY
//
// MessageText:
//
// The driver was not loaded because it failed it's initialization call.
//
  {$EXTERNALSYM STATUS_FAILED_DRIVER_ENTRY}
  STATUS_FAILED_DRIVER_ENTRY       =  TNTStatus($C0000365);

//
// MessageId: STATUS_DEVICE_ENUMERATION_ERROR
//
// MessageText:
//
// The "%hs" encountered an error while applying power or reading the device configuration.
// This may be caused by a failure of your hardware or by a poor connection.
//
  {$EXTERNALSYM STATUS_DEVICE_ENUMERATION_ERROR}
  STATUS_DEVICE_ENUMERATION_ERROR  =  TNTStatus($C0000366);

//
// MessageId: STATUS_WAIT_FOR_OPLOCK
//
// MessageText:
//
// An operation is blocked waiting for an oplock.
//
  {$EXTERNALSYM STATUS_WAIT_FOR_OPLOCK}
  STATUS_WAIT_FOR_OPLOCK           =  TNTStatus($00000367);

//
// MessageId: STATUS_MOUNT_POINT_NOT_RESOLVED
//
// MessageText:
//
// The create operation failed because the name contained at least one mount point which resolves to a volume to which the specified device object is not attached.
//
  {$EXTERNALSYM STATUS_MOUNT_POINT_NOT_RESOLVED}
  STATUS_MOUNT_POINT_NOT_RESOLVED  =  TNTStatus($C0000368);

//
// MessageId: STATUS_INVALID_DEVICE_OBJECT_PARAMETER
//
// MessageText:
//
// The device object parameter is either not a valid device object or is not attached to the volume specified by the file name.
//
  {$EXTERNALSYM STATUS_INVALID_DEVICE_OBJECT_PARAMETER}
  STATUS_INVALID_DEVICE_OBJECT_PARAMETER =  TNTStatus($C0000369);

//
// MessageId: STATUS_MCA_OCCURED
//
// MessageText:
//
// A Machine Check Error has occurred. Please check the system eventlog for additional information.
//
  {$EXTERNALSYM STATUS_MCA_OCCURED}
  STATUS_MCA_OCCURED               =  TNTStatus($C000036A);

//
// MessageId: STATUS_DRIVER_BLOCKED_CRITICAL
//
// MessageText:
//
// Driver %2 has been blocked from loading.
//
  {$EXTERNALSYM STATUS_DRIVER_BLOCKED_CRITICAL}
  STATUS_DRIVER_BLOCKED_CRITICAL   =  TNTStatus($C000036B);

//
// MessageId: STATUS_DRIVER_BLOCKED
//
// MessageText:
//
// Driver %2 has been blocked from loading.
//
  {$EXTERNALSYM STATUS_DRIVER_BLOCKED}
  STATUS_DRIVER_BLOCKED            =  TNTStatus($C000036C);

//
// MessageId: STATUS_DRIVER_DATABASE_ERROR
//
// MessageText:
//
// There was error [%2] processing the driver database.
//
  {$EXTERNALSYM STATUS_DRIVER_DATABASE_ERROR}
  STATUS_DRIVER_DATABASE_ERROR     =  TNTStatus($C000036D);

//
// MessageId: STATUS_SYSTEM_HIVE_TOO_LARGE
//
// MessageText:
//
// System hive size has exceeded its limit.
//
  {$EXTERNALSYM STATUS_SYSTEM_HIVE_TOO_LARGE}
  STATUS_SYSTEM_HIVE_TOO_LARGE     =  TNTStatus($C000036E);

//
// MessageId: STATUS_INVALID_IMPORT_OF_NON_DLL
//
// MessageText:
//
// A dynamic link library (DLL) referenced a module that was neither a DLL nor the process's executable image.
//
  {$EXTERNALSYM STATUS_INVALID_IMPORT_OF_NON_DLL}
  STATUS_INVALID_IMPORT_OF_NON_DLL =  TNTStatus($C000036F);

//
// MessageId: STATUS_DS_SHUTTING_DOWN
//
// MessageText:
//
// The Directory Service is shutting down.
//
  {$EXTERNALSYM STATUS_DS_SHUTTING_DOWN}
  STATUS_DS_SHUTTING_DOWN          =  TNTStatus($40000370);

//
// MessageId: STATUS_NO_SECRETS
//
// MessageText:
//
// The local account store does not contain secret material for the specified account.
//
  {$EXTERNALSYM STATUS_NO_SECRETS}
  STATUS_NO_SECRETS                =  TNTStatus($C0000371);

//
// MessageId: STATUS_ACCESS_DISABLED_NO_SAFER_UI_BY_POLICY
//
// MessageText:
//
// Access to %1 has been restricted by your Administrator by policy rule %2.
//
  {$EXTERNALSYM STATUS_ACCESS_DISABLED_NO_SAFER_UI_BY_POLICY}
  STATUS_ACCESS_DISABLED_NO_SAFER_UI_BY_POLICY =  TNTStatus($C0000372);

//
// MessageId: STATUS_FAILED_STACK_SWITCH
//
// MessageText:
//
// The system was not able to allocate enough memory to perform a stack switch.
//
  {$EXTERNALSYM STATUS_FAILED_STACK_SWITCH}
  STATUS_FAILED_STACK_SWITCH       =  TNTStatus($C0000373);

//
// MessageId: STATUS_HEAP_CORRUPTION
//
// MessageText:
//
// A heap has been corrupted.
//
  {$EXTERNALSYM STATUS_HEAP_CORRUPTION}
  STATUS_HEAP_CORRUPTION           =  TNTStatus($C0000374);

//
// MessageId: STATUS_SMARTCARD_WRONG_PIN
//
// MessageText:
//
// An incorrect PIN was presented to the smart card
//
  {$EXTERNALSYM STATUS_SMARTCARD_WRONG_PIN}
  STATUS_SMARTCARD_WRONG_PIN       =  TNTStatus($C0000380);

//
// MessageId: STATUS_SMARTCARD_CARD_BLOCKED
//
// MessageText:
//
// The smart card is blocked
//
  {$EXTERNALSYM STATUS_SMARTCARD_CARD_BLOCKED}
  STATUS_SMARTCARD_CARD_BLOCKED    =  TNTStatus($C0000381);

//
// MessageId: STATUS_SMARTCARD_CARD_NOT_AUTHENTICATED
//
// MessageText:
//
// No PIN was presented to the smart card
//
  {$EXTERNALSYM STATUS_SMARTCARD_CARD_NOT_AUTHENTICATED}
  STATUS_SMARTCARD_CARD_NOT_AUTHENTICATED =  TNTStatus($C0000382);

//
// MessageId: STATUS_SMARTCARD_NO_CARD
//
// MessageText:
//
// No smart card available
//
  {$EXTERNALSYM STATUS_SMARTCARD_NO_CARD}
  STATUS_SMARTCARD_NO_CARD         =  TNTStatus($C0000383);

//
// MessageId: STATUS_SMARTCARD_NO_KEY_CONTAINER
//
// MessageText:
//
// The requested key container does not exist on the smart card
//
  {$EXTERNALSYM STATUS_SMARTCARD_NO_KEY_CONTAINER}
  STATUS_SMARTCARD_NO_KEY_CONTAINER =  TNTStatus($C0000384);

//
// MessageId: STATUS_SMARTCARD_NO_CERTIFICATE
//
// MessageText:
//
// The requested certificate does not exist on the smart card
//
  {$EXTERNALSYM STATUS_SMARTCARD_NO_CERTIFICATE}
  STATUS_SMARTCARD_NO_CERTIFICATE  =  TNTStatus($C0000385);

//
// MessageId: STATUS_SMARTCARD_NO_KEYSET
//
// MessageText:
//
// The requested keyset does not exist
//
  {$EXTERNALSYM STATUS_SMARTCARD_NO_KEYSET}
  STATUS_SMARTCARD_NO_KEYSET       =  TNTStatus($C0000386);

//
// MessageId: STATUS_SMARTCARD_IO_ERROR
//
// MessageText:
//
// A communication error with the smart card has been detected.
//
  {$EXTERNALSYM STATUS_SMARTCARD_IO_ERROR}
  STATUS_SMARTCARD_IO_ERROR        =  TNTStatus($C0000387);

//
// MessageId: STATUS_DOWNGRADE_DETECTED
//
// MessageText:
//
// The system detected a possible attempt to compromise security. Please ensure that you can contact the server that authenticated you.
//
  {$EXTERNALSYM STATUS_DOWNGRADE_DETECTED}
  STATUS_DOWNGRADE_DETECTED        =  TNTStatus($C0000388);

//
// MessageId: STATUS_SMARTCARD_CERT_REVOKED
//
// MessageText:
//
// The smartcard certificate used for authentication has been revoked.
// Please contact your system administrator.  There may be additional information in the
// event log.
//
  {$EXTERNALSYM STATUS_SMARTCARD_CERT_REVOKED}
  STATUS_SMARTCARD_CERT_REVOKED    =  TNTStatus($C0000389);

//
// MessageId: STATUS_ISSUING_CA_UNTRUSTED
//
// MessageText:
//
// An untrusted certificate authority was detected While processing the
// smartcard certificate used for authentication.  Please contact your system
// administrator.
//
  {$EXTERNALSYM STATUS_ISSUING_CA_UNTRUSTED}
  STATUS_ISSUING_CA_UNTRUSTED      =  TNTStatus($C000038A);

//
// MessageId: STATUS_REVOCATION_OFFLINE_C
//
// MessageText:
//
// The revocation status of the smartcard certificate used for
// authentication could not be determined. Please contact your system administrator.
//
  {$EXTERNALSYM STATUS_REVOCATION_OFFLINE_C}
  STATUS_REVOCATION_OFFLINE_C      =  TNTStatus($C000038B);

//
// MessageId: STATUS_PKINIT_CLIENT_FAILURE
//
// MessageText:
//
// The smartcard certificate used for authentication was not trusted.  Please
// contact your system administrator.
//
  {$EXTERNALSYM STATUS_PKINIT_CLIENT_FAILURE}
  STATUS_PKINIT_CLIENT_FAILURE     =  TNTStatus($C000038C);

//
// MessageId: STATUS_SMARTCARD_CERT_EXPIRED
//
// MessageText:
//
// The smartcard certificate used for authentication has expired.  Please
// contact your system administrator.
//
  {$EXTERNALSYM STATUS_SMARTCARD_CERT_EXPIRED}
  STATUS_SMARTCARD_CERT_EXPIRED    =  TNTStatus($C000038D);

//
// MessageId: STATUS_DRIVER_FAILED_PRIOR_UNLOAD
//
// MessageText:
//
// The driver could not be loaded because a previous version of the driver is still in memory.
//
  {$EXTERNALSYM STATUS_DRIVER_FAILED_PRIOR_UNLOAD}
  STATUS_DRIVER_FAILED_PRIOR_UNLOAD =  TNTStatus($C000038E);

//
// MessageId: STATUS_SMARTCARD_SILENT_CONTEXT
//
// MessageText:
//
// The smartcard provider could not perform the action since the context was acquired as silent.
//
  {$EXTERNALSYM STATUS_SMARTCARD_SILENT_CONTEXT}
  STATUS_SMARTCARD_SILENT_CONTEXT  =  TNTStatus($C000038F);

(* MessageId up to 0x400 is reserved for smart cards *)
//
// MessageId: STATUS_PER_USER_TRUST_QUOTA_EXCEEDED
//
// MessageText:
//
// The current user's delegated trust creation quota has been exceeded.
//
  {$EXTERNALSYM STATUS_PER_USER_TRUST_QUOTA_EXCEEDED}
  STATUS_PER_USER_TRUST_QUOTA_EXCEEDED =  TNTStatus($C0000401);

//
// MessageId: STATUS_ALL_USER_TRUST_QUOTA_EXCEEDED
//
// MessageText:
//
// The total delegated trust creation quota has been exceeded.
//
  {$EXTERNALSYM STATUS_ALL_USER_TRUST_QUOTA_EXCEEDED}
  STATUS_ALL_USER_TRUST_QUOTA_EXCEEDED =  TNTStatus($C0000402);

//
// MessageId: STATUS_USER_DELETE_TRUST_QUOTA_EXCEEDED
//
// MessageText:
//
// The current user's delegated trust deletion quota has been exceeded.
//
  {$EXTERNALSYM STATUS_USER_DELETE_TRUST_QUOTA_EXCEEDED}
  STATUS_USER_DELETE_TRUST_QUOTA_EXCEEDED =  TNTStatus($C0000403);

//
// MessageId: STATUS_DS_NAME_NOT_UNIQUE
//
// MessageText:
//
// The requested name already exists as a unique identifier.
//
  {$EXTERNALSYM STATUS_DS_NAME_NOT_UNIQUE}
  STATUS_DS_NAME_NOT_UNIQUE        =  TNTStatus($C0000404);

//
// MessageId: STATUS_DS_DUPLICATE_ID_FOUND
//
// MessageText:
//
// The requested object has a non-unique identifier and cannot be retrieved.
//
  {$EXTERNALSYM STATUS_DS_DUPLICATE_ID_FOUND}
  STATUS_DS_DUPLICATE_ID_FOUND     =  TNTStatus($C0000405);

//
// MessageId: STATUS_DS_GROUP_CONVERSION_ERROR
//
// MessageText:
//
// The group cannot be converted due to attribute restrictions on the requested group type.
//
  {$EXTERNALSYM STATUS_DS_GROUP_CONVERSION_ERROR}
  STATUS_DS_GROUP_CONVERSION_ERROR =  TNTStatus($C0000406);

//
// MessageId: STATUS_VOLSNAP_PREPARE_HIBERNATE
//
// MessageText:
//
// {Volume Shadow Copy Service}
// Please wait while the Volume Shadow Copy Service prepares volume %hs for hibernation.
//
  {$EXTERNALSYM STATUS_VOLSNAP_PREPARE_HIBERNATE}
  STATUS_VOLSNAP_PREPARE_HIBERNATE =  TNTStatus($C0000407);

//
// MessageId: STATUS_USER2USER_REQUIRED
//
// MessageText:
//
// Kerberos sub-protocol User2User is required.
//
  {$EXTERNALSYM STATUS_USER2USER_REQUIRED}
  STATUS_USER2USER_REQUIRED        =  TNTStatus($C0000408);

//
// MessageId: STATUS_STACK_BUFFER_OVERRUN
//
// MessageText:
//
// The system detected an overrun of a stack-based buffer in this application.  This
// overrun could potentially allow a malicious user to gain control of this application.
//
  {$EXTERNALSYM STATUS_STACK_BUFFER_OVERRUN}
  STATUS_STACK_BUFFER_OVERRUN      =  TNTStatus($C0000409);

//
// MessageId: STATUS_NO_S4U_PROT_SUPPORT
//
// MessageText:
//
// The Kerberos subsystem encountered an error.  A service for user protocol request was made
// against a domain controller which does not support service for user.
//
  {$EXTERNALSYM STATUS_NO_S4U_PROT_SUPPORT}
  STATUS_NO_S4U_PROT_SUPPORT       =  TNTStatus($C000040A);

//
// MessageId: STATUS_CROSSREALM_DELEGATION_FAILURE
//
// MessageText:
//
// An attempt was made by this server to make a Kerberos constrained delegation request for a target
// outside of the server's realm.  This is not supported, and indicates a misconfiguration on this
// server's allowed to delegate to list.  Please contact your administrator.
//
  {$EXTERNALSYM STATUS_CROSSREALM_DELEGATION_FAILURE}
  STATUS_CROSSREALM_DELEGATION_FAILURE =  TNTStatus($C000040B);

//
// MessageId: STATUS_REVOCATION_OFFLINE_KDC
//
// MessageText:
//
// The revocation status of the domain controller certificate used for smartcard
// authentication could not be determined.  There is additional information in the system event
// log. Please contact your system administrator.
//
  {$EXTERNALSYM STATUS_REVOCATION_OFFLINE_KDC}
  STATUS_REVOCATION_OFFLINE_KDC    =  TNTStatus($C000040C);

//
// MessageId: STATUS_ISSUING_CA_UNTRUSTED_KDC
//
// MessageText:
//
// An untrusted certificate authority was detected while processing the
// domain controller certificate used for authentication.  There is additional information in
// the system event log.  Please contact your system administrator.
//
  {$EXTERNALSYM STATUS_ISSUING_CA_UNTRUSTED_KDC}
  STATUS_ISSUING_CA_UNTRUSTED_KDC  =  TNTStatus($C000040D);

//
// MessageId: STATUS_KDC_CERT_EXPIRED
//
// MessageText:
//
// The domain controller certificate used for smartcard logon has expired.
// Please contact your system administrator with the contents of your system event log.
//
  {$EXTERNALSYM STATUS_KDC_CERT_EXPIRED}
  STATUS_KDC_CERT_EXPIRED          =  TNTStatus($C000040E);

//
// MessageId: STATUS_KDC_CERT_REVOKED
//
// MessageText:
//
// The domain controller certificate used for smartcard logon has been revoked.
// Please contact your system administrator with the contents of your system event log.
//
  {$EXTERNALSYM STATUS_KDC_CERT_REVOKED}
  STATUS_KDC_CERT_REVOKED          =  TNTStatus($C000040F);

//
// MessageId: STATUS_PARAMETER_QUOTA_EXCEEDED
//
// MessageText:
//
// Data present in one of the parameters is more than the function can operate on.
//
  {$EXTERNALSYM STATUS_PARAMETER_QUOTA_EXCEEDED}
  STATUS_PARAMETER_QUOTA_EXCEEDED  =  TNTStatus($C0000410);

//
// MessageId: STATUS_HIBERNATION_FAILURE
//
// MessageText:
//
// The system has failed to hibernate (The error code is %hs).  Hibernation will be disabled until the system is restarted.
//
  {$EXTERNALSYM STATUS_HIBERNATION_FAILURE}
  STATUS_HIBERNATION_FAILURE       =  TNTStatus($C0000411);

//
// MessageId: STATUS_DELAY_LOAD_FAILED
//
// MessageText:
//
// An attempt to delay-load a .dll or get a function address in a delay-loaded .dll failed.
//
  {$EXTERNALSYM STATUS_DELAY_LOAD_FAILED}
  STATUS_DELAY_LOAD_FAILED         =  TNTStatus($C0000412);

//
// MessageId: STATUS_AUTHENTICATION_FIREWALL_FAILED
//
// MessageText:
//
// Logon Failure: The machine you are logging onto is protected by an authentication firewall.  The specified account is not allowed to authenticate to the machine.
//
  {$EXTERNALSYM STATUS_AUTHENTICATION_FIREWALL_FAILED}
  STATUS_AUTHENTICATION_FIREWALL_FAILED =  TNTStatus($C0000413);

//
// MessageId: STATUS_VDM_DISALLOWED
//
// MessageText:
//
// %hs is a 16-bit application. You do not have permissions to execute 16-bit applications. Check your permissions with your system administrator.
//
  {$EXTERNALSYM STATUS_VDM_DISALLOWED}
  STATUS_VDM_DISALLOWED            =  TNTStatus($C0000414);

//
// MessageId: STATUS_HUNG_DISPLAY_DRIVER_THREAD
//
// MessageText:
//
// {Display Driver Stopped Responding}
// The %hs display driver has stopped working normally.  Save your work and reboot the system to restore full display functionality.
// The next time you reboot the machine a dialog will be displayed giving you a chance to report this failure to Microsoft.
//
  {$EXTERNALSYM STATUS_HUNG_DISPLAY_DRIVER_THREAD}
  STATUS_HUNG_DISPLAY_DRIVER_THREAD =  TNTStatus($C0000415);

//
// MessageId: STATUS_INSUFFICIENT_RESOURCE_FOR_SPECIFIED_SHARED_SECTION_SIZE
//
// MessageText:
//
// The Desktop heap encountered an error while allocating session memory.  There is more information in the system event log.
//
  {$EXTERNALSYM STATUS_INSUFFICIENT_RESOURCE_FOR_SPECIFIED_SHARED_SECTION_SIZE}
  STATUS_INSUFFICIENT_RESOURCE_FOR_SPECIFIED_SHARED_SECTION_SIZE =  TNTStatus($C0000416);

//
// MessageId: STATUS_INVALID_CRUNTIME_PARAMETER
//
// MessageText:
//
// An invalid parameter was passed to a C runtime function.
//
  {$EXTERNALSYM STATUS_INVALID_CRUNTIME_PARAMETER}
  STATUS_INVALID_CRUNTIME_PARAMETER =  TNTStatus($C0000417);

//
// MessageId: STATUS_NTLM_BLOCKED
//
// MessageText:
//
// The authentication failed since NTLM was blocked.
//
  {$EXTERNALSYM STATUS_NTLM_BLOCKED}
  STATUS_NTLM_BLOCKED              =  TNTStatus($C0000418);

(*++

MessageId=0x0420 Facility=System Severity=ERROR SymbolicName=STATUS_ASSERTION_FAILURE
Language=English
An assertion failure has occurred.
.

--*)

  {$EXTERNALSYM STATUS_ASSERTION_FAILURE}
  STATUS_ASSERTION_FAILURE         =  TNTStatus($C0000420);

//
// MessageId: STATUS_VERIFIER_STOP
//
// MessageText:
//
// Application verifier has found an error in the current process.
//
  {$EXTERNALSYM STATUS_VERIFIER_STOP}
  STATUS_VERIFIER_STOP             =  TNTStatus($C0000421);

(*++

 MessageId=0x0423 Facility=System Severity=ERROR SymbolicName=STATUS_CALLBACK_POP_STACK
 Language=English
 An exception has occurred in a user mode callback and the kernel callback frame should be removed.
 .

--*)

  {$EXTERNALSYM STATUS_CALLBACK_POP_STACK}
  STATUS_CALLBACK_POP_STACK        =  TNTStatus($C0000423);

//
// MessageId: STATUS_INCOMPATIBLE_DRIVER_BLOCKED
//
// MessageText:
//
// %2 has been blocked from loading due to incompatibility with this system. Please contact your software
// vendor for a compatible version of the driver.
//
  {$EXTERNALSYM STATUS_INCOMPATIBLE_DRIVER_BLOCKED}
  STATUS_INCOMPATIBLE_DRIVER_BLOCKED =  TNTStatus($C0000424);

//
// MessageId: STATUS_HIVE_UNLOADED
//
// MessageText:
//
// Illegal operation attempted on a registry key which has already been unloaded.
//
  {$EXTERNALSYM STATUS_HIVE_UNLOADED}
  STATUS_HIVE_UNLOADED             =  TNTStatus($C0000425);

//
// MessageId: STATUS_COMPRESSION_DISABLED
//
// MessageText:
//
// Compression is disabled for this volume.
//
  {$EXTERNALSYM STATUS_COMPRESSION_DISABLED}
  STATUS_COMPRESSION_DISABLED      =  TNTStatus($C0000426);

//
// MessageId: STATUS_FILE_SYSTEM_LIMITATION
//
// MessageText:
//
// The requested operation could not be completed due to a file system limitation
//
  {$EXTERNALSYM STATUS_FILE_SYSTEM_LIMITATION}
  STATUS_FILE_SYSTEM_LIMITATION    =  TNTStatus($C0000427);

//
// MessageId: STATUS_INVALID_IMAGE_HASH
//
// MessageText:
//
// Windows cannot verify the digital signature for this file. A recent hardware or software change might have installed a file that is signed incorrectly or damaged, or that might be malicious software from an unknown source.
//
  {$EXTERNALSYM STATUS_INVALID_IMAGE_HASH}
  STATUS_INVALID_IMAGE_HASH        =  TNTStatus($C0000428);

//
// MessageId: STATUS_NOT_CAPABLE
//
// MessageText:
//
// The implementation is not capable of performing the request.
//
  {$EXTERNALSYM STATUS_NOT_CAPABLE}
  STATUS_NOT_CAPABLE               =  TNTStatus($C0000429);

//
// MessageId: STATUS_REQUEST_OUT_OF_SEQUENCE
//
// MessageText:
//
// The requested operation is out of order with respect to other operations.
//
  {$EXTERNALSYM STATUS_REQUEST_OUT_OF_SEQUENCE}
  STATUS_REQUEST_OUT_OF_SEQUENCE   =  TNTStatus($C000042A);

//
// MessageId: STATUS_IMPLEMENTATION_LIMIT
//
// MessageText:
//
// An operation attempted to exceed an implementation-defined limit.
//
  {$EXTERNALSYM STATUS_IMPLEMENTATION_LIMIT}
  STATUS_IMPLEMENTATION_LIMIT      =  TNTStatus($C000042B);

//
// MessageId: STATUS_ELEVATION_REQUIRED
//
// MessageText:
//
// The requested operation requires elevation.
//
  {$EXTERNALSYM STATUS_ELEVATION_REQUIRED}
  STATUS_ELEVATION_REQUIRED        =  TNTStatus($C000042C);

//
// MessageId: STATUS_BEYOND_VDL
//
// MessageText:
//
// The operation was attempted beyond the valid data length of the file.
//
  {$EXTERNALSYM STATUS_BEYOND_VDL}
  STATUS_BEYOND_VDL                =  TNTStatus($C0000432);

//
// MessageId: STATUS_ENCOUNTERED_WRITE_IN_PROGRESS
//
// MessageText:
//
// The attempted write operation encountered a write already in progress for some portion of the range.
//
  {$EXTERNALSYM STATUS_ENCOUNTERED_WRITE_IN_PROGRESS}
  STATUS_ENCOUNTERED_WRITE_IN_PROGRESS =  TNTStatus($C0000433);

//
// MessageId: STATUS_PTE_CHANGED
//
// MessageText:
//
// The page fault mappings changed in the middle of processing a fault so the operation must be retried.
//
  {$EXTERNALSYM STATUS_PTE_CHANGED}
  STATUS_PTE_CHANGED               =  TNTStatus($C0000434);

//
// MessageId: STATUS_PURGE_FAILED
//
// MessageText:
//
// The attempt to purge this file from memory failed to purge some or all the data from memory.
//
  {$EXTERNALSYM STATUS_PURGE_FAILED}
  STATUS_PURGE_FAILED              =  TNTStatus($C0000435);

//
// MessageId: STATUS_CRED_REQUIRES_CONFIRMATION
//
// MessageText:
//
// The requested credential requires confirmation.
//
  {$EXTERNALSYM STATUS_CRED_REQUIRES_CONFIRMATION}
  STATUS_CRED_REQUIRES_CONFIRMATION =  TNTStatus($C0000440);

//
// MessageId: STATUS_CS_ENCRYPTION_INVALID_SERVER_RESPONSE
//
// MessageText:
//
// The remote server sent an invalid response for a file being opened with Client Side Encryption.
//
  {$EXTERNALSYM STATUS_CS_ENCRYPTION_INVALID_SERVER_RESPONSE}
  STATUS_CS_ENCRYPTION_INVALID_SERVER_RESPONSE =  TNTStatus($C0000441);

//
// MessageId: STATUS_CS_ENCRYPTION_UNSUPPORTED_SERVER
//
// MessageText:
//
// Client Side Encryption is not supported by the remote server even though it claims to support it.
//
  {$EXTERNALSYM STATUS_CS_ENCRYPTION_UNSUPPORTED_SERVER}
  STATUS_CS_ENCRYPTION_UNSUPPORTED_SERVER =  TNTStatus($C0000442);

//
// MessageId: STATUS_CS_ENCRYPTION_EXISTING_ENCRYPTED_FILE
//
// MessageText:
//
// File is encrypted and should be opened in Client Side Encryption mode.
//
  {$EXTERNALSYM STATUS_CS_ENCRYPTION_EXISTING_ENCRYPTED_FILE}
  STATUS_CS_ENCRYPTION_EXISTING_ENCRYPTED_FILE =  TNTStatus($C0000443);

//
// MessageId: STATUS_CS_ENCRYPTION_NEW_ENCRYPTED_FILE
//
// MessageText:
//
// A new encrypted file is being created and a $EFS needs to be provided.
//
  {$EXTERNALSYM STATUS_CS_ENCRYPTION_NEW_ENCRYPTED_FILE}
  STATUS_CS_ENCRYPTION_NEW_ENCRYPTED_FILE =  TNTStatus($C0000444);

//
// MessageId: STATUS_CS_ENCRYPTION_FILE_NOT_CSE
//
// MessageText:
//
// The SMB client requested a CSE FSCTL on a non-CSE file.
//
  {$EXTERNALSYM STATUS_CS_ENCRYPTION_FILE_NOT_CSE}
  STATUS_CS_ENCRYPTION_FILE_NOT_CSE =  TNTStatus($C0000445);

//
// MessageId: STATUS_INVALID_LABEL
//
// MessageText:
//
// Indicates a particular Security ID may not be assigned as the label of an object.
//
  {$EXTERNALSYM STATUS_INVALID_LABEL}
  STATUS_INVALID_LABEL             =  TNTStatus($C0000446);

//
// MessageId: STATUS_DRIVER_PROCESS_TERMINATED
//
// MessageText:
//
// The process hosting the driver for this device has terminated.
//
  {$EXTERNALSYM STATUS_DRIVER_PROCESS_TERMINATED}
  STATUS_DRIVER_PROCESS_TERMINATED =  TNTStatus($C0000450);

//
// MessageId: STATUS_AMBIGUOUS_SYSTEM_DEVICE
//
// MessageText:
//
// The requested system device cannot be identified due to multiple indistinguishable devices potentially matching the identification criteria.
//
  {$EXTERNALSYM STATUS_AMBIGUOUS_SYSTEM_DEVICE}
  STATUS_AMBIGUOUS_SYSTEM_DEVICE   =  TNTStatus($C0000451);

//
// MessageId: STATUS_SYSTEM_DEVICE_NOT_FOUND
//
// MessageText:
//
// The requested system device cannot be found.
//
  {$EXTERNALSYM STATUS_SYSTEM_DEVICE_NOT_FOUND}
  STATUS_SYSTEM_DEVICE_NOT_FOUND   =  TNTStatus($C0000452);

//
// MessageId: STATUS_RESTART_BOOT_APPLICATION
//
// MessageText:
//
// This boot application must be restarted.
//
  {$EXTERNALSYM STATUS_RESTART_BOOT_APPLICATION}
  STATUS_RESTART_BOOT_APPLICATION  =  TNTStatus($C0000453);

//
// MessageId: STATUS_INVALID_TASK_NAME
//
// MessageText:
//
// The specified task name is invalid.
//
  {$EXTERNALSYM STATUS_INVALID_TASK_NAME}
  STATUS_INVALID_TASK_NAME         =  TNTStatus($C0000500);

//
// MessageId: STATUS_INVALID_TASK_INDEX
//
// MessageText:
//
// The specified task index is invalid.
//
  {$EXTERNALSYM STATUS_INVALID_TASK_INDEX}
  STATUS_INVALID_TASK_INDEX        =  TNTStatus($C0000501);

//
// MessageId: STATUS_THREAD_ALREADY_IN_TASK
//
// MessageText:
//
// The specified thread is already joining a task.
//
  {$EXTERNALSYM STATUS_THREAD_ALREADY_IN_TASK}
  STATUS_THREAD_ALREADY_IN_TASK    =  TNTStatus($C0000502);

//
// MessageId: STATUS_CALLBACK_BYPASS
//
// MessageText:
//
// A callback has requested to bypass native code.
//
  {$EXTERNALSYM STATUS_CALLBACK_BYPASS}
  STATUS_CALLBACK_BYPASS           =  TNTStatus($C0000503);

//
// MessageId: STATUS_PORT_CLOSED
//
// MessageText:
//
// The ALPC port is closed.
//
  {$EXTERNALSYM STATUS_PORT_CLOSED}
  STATUS_PORT_CLOSED               =  TNTStatus($C0000700);

//
// MessageId: STATUS_MESSAGE_LOST
//
// MessageText:
//
// The ALPC message requested is no longer available.
//
  {$EXTERNALSYM STATUS_MESSAGE_LOST}
  STATUS_MESSAGE_LOST              =  TNTStatus($C0000701);

//
// MessageId: STATUS_INVALID_MESSAGE
//
// MessageText:
//
// The ALPC message supplied is invalid.
//
  {$EXTERNALSYM STATUS_INVALID_MESSAGE}
  STATUS_INVALID_MESSAGE           =  TNTStatus($C0000702);

//
// MessageId: STATUS_REQUEST_CANCELED
//
// MessageText:
//
// The ALPC message has been canceled.
//
  {$EXTERNALSYM STATUS_REQUEST_CANCELED}
  STATUS_REQUEST_CANCELED          =  TNTStatus($C0000703);

//
// MessageId: STATUS_RECURSIVE_DISPATCH
//
// MessageText:
//
// Invalid recursive dispatch attempt.
//
  {$EXTERNALSYM STATUS_RECURSIVE_DISPATCH}
  STATUS_RECURSIVE_DISPATCH        =  TNTStatus($C0000704);

//
// MessageId: STATUS_LPC_RECEIVE_BUFFER_EXPECTED
//
// MessageText:
//
// No receive buffer has been supplied in a synchrounus request.
//
  {$EXTERNALSYM STATUS_LPC_RECEIVE_BUFFER_EXPECTED}
  STATUS_LPC_RECEIVE_BUFFER_EXPECTED =  TNTStatus($C0000705);

//
// MessageId: STATUS_LPC_INVALID_CONNECTION_USAGE
//
// MessageText:
//
// The connection port is used in an invalid context.
//
  {$EXTERNALSYM STATUS_LPC_INVALID_CONNECTION_USAGE}
  STATUS_LPC_INVALID_CONNECTION_USAGE =  TNTStatus($C0000706);

//
// MessageId: STATUS_LPC_REQUESTS_NOT_ALLOWED
//
// MessageText:
//
// The ALPC port does not accept new request messages.
//
  {$EXTERNALSYM STATUS_LPC_REQUESTS_NOT_ALLOWED}
  STATUS_LPC_REQUESTS_NOT_ALLOWED  =  TNTStatus($C0000707);

//
// MessageId: STATUS_RESOURCE_IN_USE
//
// MessageText:
//
// The resource requested is already in use.
//
  {$EXTERNALSYM STATUS_RESOURCE_IN_USE}
  STATUS_RESOURCE_IN_USE           =  TNTStatus($C0000708);

//
// MessageId: STATUS_HARDWARE_MEMORY_ERROR
//
// MessageText:
//
// The hardware has reported an uncorrectable memory error.
//
  {$EXTERNALSYM STATUS_HARDWARE_MEMORY_ERROR}
  STATUS_HARDWARE_MEMORY_ERROR     =  TNTStatus($C0000709);

//
// MessageId: STATUS_THREADPOOL_HANDLE_EXCEPTION
//
// MessageText:
//
// Status 0x%08x was returned, waiting on handle 0x%x for wait 0x%p, in waiter 0x%p.
//
  {$EXTERNALSYM STATUS_THREADPOOL_HANDLE_EXCEPTION}
  STATUS_THREADPOOL_HANDLE_EXCEPTION =  TNTStatus($C000070A);

//
// MessageId: STATUS_THREADPOOL_SET_EVENT_ON_COMPLETION_FAILED
//
// MessageText:
//
// After a callback to 0x%p(0x%p), a completion call to SetEvent(0x%p) failed with status 0x%08x.
//
  {$EXTERNALSYM STATUS_THREADPOOL_SET_EVENT_ON_COMPLETION_FAILED}
  STATUS_THREADPOOL_SET_EVENT_ON_COMPLETION_FAILED =  TNTStatus($C000070B);

//
// MessageId: STATUS_THREADPOOL_RELEASE_SEMAPHORE_ON_COMPLETION_FAILED
//
// MessageText:
//
// After a callback to 0x%p(0x%p), a completion call to ReleaseSemaphore(0x%p, %d) failed with status 0x%08x.
//
  {$EXTERNALSYM STATUS_THREADPOOL_RELEASE_SEMAPHORE_ON_COMPLETION_FAILED}
  STATUS_THREADPOOL_RELEASE_SEMAPHORE_ON_COMPLETION_FAILED =  TNTStatus($C000070C);

//
// MessageId: STATUS_THREADPOOL_RELEASE_MUTEX_ON_COMPLETION_FAILED
//
// MessageText:
//
// After a callback to 0x%p(0x%p), a completion call to ReleaseMutex(%p) failed with status 0x%08x.
//
  {$EXTERNALSYM STATUS_THREADPOOL_RELEASE_MUTEX_ON_COMPLETION_FAILED}
  STATUS_THREADPOOL_RELEASE_MUTEX_ON_COMPLETION_FAILED =  TNTStatus($C000070D);

//
// MessageId: STATUS_THREADPOOL_FREE_LIBRARY_ON_COMPLETION_FAILED
//
// MessageText:
//
// After a callback to 0x%p(0x%p), an completion call to FreeLibrary(%p) failed with status 0x%08x.
//
  {$EXTERNALSYM STATUS_THREADPOOL_FREE_LIBRARY_ON_COMPLETION_FAILED}
  STATUS_THREADPOOL_FREE_LIBRARY_ON_COMPLETION_FAILED =  TNTStatus($C000070E);

//
// MessageId: STATUS_THREADPOOL_RELEASED_DURING_OPERATION
//
// MessageText:
//
// The threadpool 0x%p was released while a thread was posting a callback to 0x%p(0x%p) to it.
//
  {$EXTERNALSYM STATUS_THREADPOOL_RELEASED_DURING_OPERATION}
  STATUS_THREADPOOL_RELEASED_DURING_OPERATION =  TNTStatus($C000070F);

//
// MessageId: STATUS_CALLBACK_RETURNED_WHILE_IMPERSONATING
//
// MessageText:
//
// A threadpool worker thread is impersonating a client, after a callback to 0x%p(0x%p).
// This is unexpected, indicating that the callback is missing a call to revert the impersonation.
//
  {$EXTERNALSYM STATUS_CALLBACK_RETURNED_WHILE_IMPERSONATING}
  STATUS_CALLBACK_RETURNED_WHILE_IMPERSONATING =  TNTStatus($C0000710);

//
// MessageId: STATUS_APC_RETURNED_WHILE_IMPERSONATING
//
// MessageText:
//
// A threadpool worker thread is impersonating a client, after executing an APC.
// This is unexpected, indicating that the APC is missing a call to revert the impersonation.
//
  {$EXTERNALSYM STATUS_APC_RETURNED_WHILE_IMPERSONATING}
  STATUS_APC_RETURNED_WHILE_IMPERSONATING =  TNTStatus($C0000711);

//
// MessageId: STATUS_PROCESS_IS_PROTECTED
//
// MessageText:
//
// Either the target process, or the target thread's containing process, is a protected process.
//
  {$EXTERNALSYM STATUS_PROCESS_IS_PROTECTED}
  STATUS_PROCESS_IS_PROTECTED      =  TNTStatus($C0000712);

//
// MessageId: STATUS_MCA_EXCEPTION
//
// MessageText:
//
// A Thread is getting dispatched with MCA EXCEPTION because of MCA.
//
  {$EXTERNALSYM STATUS_MCA_EXCEPTION}
  STATUS_MCA_EXCEPTION             =  TNTStatus($C0000713);

//
// MessageId: STATUS_CERTIFICATE_MAPPING_NOT_UNIQUE
//
// MessageText:
//
// The client certificate account mapping is not unique.
//
  {$EXTERNALSYM STATUS_CERTIFICATE_MAPPING_NOT_UNIQUE}
  STATUS_CERTIFICATE_MAPPING_NOT_UNIQUE =  TNTStatus($C0000714);

//
// MessageId: STATUS_SYMLINK_CLASS_DISABLED
//
// MessageText:
//
// The symbolic link cannot be followed because its type is disabled.
//
  {$EXTERNALSYM STATUS_SYMLINK_CLASS_DISABLED}
  STATUS_SYMLINK_CLASS_DISABLED    =  TNTStatus($C0000715);

//
// MessageId: STATUS_INVALID_IDN_NORMALIZATION
//
// MessageText:
//
// Indicates that the specified string is not valid for IDN normalization.
//
  {$EXTERNALSYM STATUS_INVALID_IDN_NORMALIZATION}
  STATUS_INVALID_IDN_NORMALIZATION =  TNTStatus($C0000716);

//
// MessageId: STATUS_NO_UNICODE_TRANSLATION
//
// MessageText:
//
// No mapping for the Unicode character exists in the target multi-byte code page.
//
  {$EXTERNALSYM STATUS_NO_UNICODE_TRANSLATION}
  STATUS_NO_UNICODE_TRANSLATION    =  TNTStatus($C0000717);

//
// MessageId: STATUS_ALREADY_REGISTERED
//
// MessageText:
//
// The provided callback is already registered.
//
  {$EXTERNALSYM STATUS_ALREADY_REGISTERED}
  STATUS_ALREADY_REGISTERED        =  TNTStatus($C0000718);

//
// MessageId: STATUS_CONTEXT_MISMATCH
//
// MessageText:
//
// The provided context did not match the target.
//
  {$EXTERNALSYM STATUS_CONTEXT_MISMATCH}
  STATUS_CONTEXT_MISMATCH          =  TNTStatus($C0000719);

//
// MessageId: STATUS_PORT_ALREADY_HAS_COMPLETION_LIST
//
// MessageText:
//
// The specified port already has a completion list.
//
  {$EXTERNALSYM STATUS_PORT_ALREADY_HAS_COMPLETION_LIST}
  STATUS_PORT_ALREADY_HAS_COMPLETION_LIST =  TNTStatus($C000071A);

//
// MessageId: STATUS_CALLBACK_RETURNED_THREAD_PRIORITY
//
// MessageText:
//
// A threadpool worker thread enter a callback at thread base priority 0x%x and exited at priority 0x%x.
// This is unexpected, indicating that the callback missed restoring the priority.
//
  {$EXTERNALSYM STATUS_CALLBACK_RETURNED_THREAD_PRIORITY}
  STATUS_CALLBACK_RETURNED_THREAD_PRIORITY =  TNTStatus($C000071B);

//
// MessageId: STATUS_INVALID_THREAD
//
// MessageText:
//
// An invalid thread, handle %p, is specified for this operation.  Possibly, a threadpool worker thread was specified.
//
  {$EXTERNALSYM STATUS_INVALID_THREAD}
  STATUS_INVALID_THREAD            =  TNTStatus($C000071C);

//
// MessageId: STATUS_CALLBACK_RETURNED_TRANSACTION
//
// MessageText:
//
// A threadpool worker thread enter a callback, which left transaction state.
// This is unexpected, indicating that the callback missed clearing the transaction.
//
  {$EXTERNALSYM STATUS_CALLBACK_RETURNED_TRANSACTION}
  STATUS_CALLBACK_RETURNED_TRANSACTION =  TNTStatus($C000071D);

//
// MessageId: STATUS_CALLBACK_RETURNED_LDR_LOCK
//
// MessageText:
//
// A threadpool worker thread enter a callback, which left the loader lock held.
// This is unexpected, indicating that the callback missed releasing the lock.
//
  {$EXTERNALSYM STATUS_CALLBACK_RETURNED_LDR_LOCK}
  STATUS_CALLBACK_RETURNED_LDR_LOCK =  TNTStatus($C000071E);

//
// MessageId: STATUS_CALLBACK_RETURNED_LANG
//
// MessageText:
//
// A threadpool worker thread enter a callback, which left with preferred languages set.
// This is unexpected, indicating that the callback missed clearing them.
//
  {$EXTERNALSYM STATUS_CALLBACK_RETURNED_LANG}
  STATUS_CALLBACK_RETURNED_LANG    =  TNTStatus($C000071F);

//
// MessageId: STATUS_CALLBACK_RETURNED_PRI_BACK
//
// MessageText:
//
// A threadpool worker thread enter a callback, which left with background priorities set.
// This is unexpected, indicating that the callback missed restoring the original priorities.
//
  {$EXTERNALSYM STATUS_CALLBACK_RETURNED_PRI_BACK}
  STATUS_CALLBACK_RETURNED_PRI_BACK =  TNTStatus($C0000720);

//
// MessageId: STATUS_CALLBACK_RETURNED_THREAD_AFFINITY
//
// MessageText:
//
// A threadpool worker thread enter a callback at thread affinity %p and exited at affinity %p.
// This is unexpected, indicating that the callback missed restoring the priority.
//
  {$EXTERNALSYM STATUS_CALLBACK_RETURNED_THREAD_AFFINITY}
  STATUS_CALLBACK_RETURNED_THREAD_AFFINITY =  TNTStatus($C0000721);

//
// MessageId: STATUS_DISK_REPAIR_DISABLED
//
// MessageText:
//
// The attempted operation required self healing to be enabled.
//
  {$EXTERNALSYM STATUS_DISK_REPAIR_DISABLED}
  STATUS_DISK_REPAIR_DISABLED      =  TNTStatus($C0000800);

//
// MessageId: STATUS_DS_DOMAIN_RENAME_IN_PROGRESS
//
// MessageText:
//
// The Directory Service cannot perform the requested operation because a domain rename operation is in progress.
//
  {$EXTERNALSYM STATUS_DS_DOMAIN_RENAME_IN_PROGRESS}
  STATUS_DS_DOMAIN_RENAME_IN_PROGRESS =  TNTStatus($C0000801);

//
// MessageId: STATUS_DISK_QUOTA_EXCEEDED
//
// MessageText:
//
// The requested file operation failed because the storage quota was exceeded.
// To free up disk space, move files to a different location or delete unnecessary files. For more information, contact your system administrator.
//
  {$EXTERNALSYM STATUS_DISK_QUOTA_EXCEEDED}
  STATUS_DISK_QUOTA_EXCEEDED       =  TNTStatus($C0000802);

//
// MessageId: STATUS_DATA_LOST_REPAIR
//
// MessageText:
//
// Windows discovered a corruption in the file %hs. This file has now been repaired.
// Please check if any data in the file was lost because of the corruption.
//
  {$EXTERNALSYM STATUS_DATA_LOST_REPAIR}
  STATUS_DATA_LOST_REPAIR          =  TNTStatus($80000803);

//
// MessageId: STATUS_CONTENT_BLOCKED
//
// MessageText:
//
// The requested file operation failed because the storage policy blocks that type of file. For more information, contact your system administrator.
//
  {$EXTERNALSYM STATUS_CONTENT_BLOCKED}
  STATUS_CONTENT_BLOCKED           =  TNTStatus($C0000804);

//
// MessageId: STATUS_BAD_CLUSTERS
//
// MessageText:
//
// The operation could not be completed due to bad clusters on disk.
//
  {$EXTERNALSYM STATUS_BAD_CLUSTERS}
  STATUS_BAD_CLUSTERS              =  TNTStatus($C0000805);

//
// MessageId: STATUS_VOLUME_DIRTY
//
// MessageText:
//
// The operation could not be completed because the volume is dirty.  Please run chkdsk and try again.
//
  {$EXTERNALSYM STATUS_VOLUME_DIRTY}
  STATUS_VOLUME_DIRTY              =  TNTStatus($C0000806);

//
// MessageId: STATUS_FILE_CHECKED_OUT
//
// MessageText:
//
// This file is checked out or locked for editing by another user.
//
  {$EXTERNALSYM STATUS_FILE_CHECKED_OUT}
  STATUS_FILE_CHECKED_OUT          =  TNTStatus($C0000901);

//
// MessageId: STATUS_CHECKOUT_REQUIRED
//
// MessageText:
//
// The file must be checked out before saving changes.
//
  {$EXTERNALSYM STATUS_CHECKOUT_REQUIRED}
  STATUS_CHECKOUT_REQUIRED         =  TNTStatus($C0000902);

//
// MessageId: STATUS_BAD_FILE_TYPE
//
// MessageText:
//
// The file type being saved or retrieved has been blocked.
//
  {$EXTERNALSYM STATUS_BAD_FILE_TYPE}
  STATUS_BAD_FILE_TYPE             =  TNTStatus($C0000903);

//
// MessageId: STATUS_FILE_TOO_LARGE
//
// MessageText:
//
// The file size exceeds the limit allowed and cannot be saved.
//
  {$EXTERNALSYM STATUS_FILE_TOO_LARGE}
  STATUS_FILE_TOO_LARGE            =  TNTStatus($C0000904);

//
// MessageId: STATUS_FORMS_AUTH_REQUIRED
//
// MessageText:
//
// Access Denied.  Before opening files in this location, you must first browse to the web site and select the option to login automatically.
//
  {$EXTERNALSYM STATUS_FORMS_AUTH_REQUIRED}
  STATUS_FORMS_AUTH_REQUIRED       =  TNTStatus($C0000905);

//
// MessageId: STATUS_VIRUS_INFECTED
//
// MessageText:
//
// Operation did not complete successfully because the file contains a virus.
//
  {$EXTERNALSYM STATUS_VIRUS_INFECTED}
  STATUS_VIRUS_INFECTED            =  TNTStatus($C0000906);

//
// MessageId: STATUS_VIRUS_DELETED
//
// MessageText:
//
// This file contains a virus and cannot be opened. Due to the nature of this virus, the file has been removed from this location.
//
  {$EXTERNALSYM STATUS_VIRUS_DELETED}
  STATUS_VIRUS_DELETED             =  TNTStatus($C0000907);

//
// MessageId: STATUS_BAD_MCFG_TABLE
//
// MessageText:
//
// The resources required for this device conflict with the MCFG table.
//
  {$EXTERNALSYM STATUS_BAD_MCFG_TABLE}
  STATUS_BAD_MCFG_TABLE            =  TNTStatus($C0000908);

//
// MessageId: STATUS_WOW_ASSERTION
//
// MessageText:
//
// WOW Assertion Error.
//
  {$EXTERNALSYM STATUS_WOW_ASSERTION}
  STATUS_WOW_ASSERTION             =  TNTStatus($C0009898);

//
// MessageId: STATUS_INVALID_SIGNATURE
//
// MessageText:
//
// The cryptographic signature is invalid.
//
  {$EXTERNALSYM STATUS_INVALID_SIGNATURE}
  STATUS_INVALID_SIGNATURE         =  TNTStatus($C000A000);

//
// MessageId: STATUS_HMAC_NOT_SUPPORTED
//
// MessageText:
//
// The cryptographic provider does not support HMAC.
//
  {$EXTERNALSYM STATUS_HMAC_NOT_SUPPORTED}
  STATUS_HMAC_NOT_SUPPORTED        =  TNTStatus($C000A001);

(*++

 MessageId's 0xa010 - 0xa07f (inclusive) are reserved for TCPIP errors.

--*)
//
// MessageId: STATUS_IPSEC_QUEUE_OVERFLOW
//
// MessageText:
//
// The IPSEC queue overflowed.
//
  {$EXTERNALSYM STATUS_IPSEC_QUEUE_OVERFLOW}
  STATUS_IPSEC_QUEUE_OVERFLOW      =  TNTStatus($C000A010);

//
// MessageId: STATUS_ND_QUEUE_OVERFLOW
//
// MessageText:
//
// The neighbor discovery queue overflowed.
//
  {$EXTERNALSYM STATUS_ND_QUEUE_OVERFLOW}
  STATUS_ND_QUEUE_OVERFLOW         =  TNTStatus($C000A011);

//
// MessageId: STATUS_HOPLIMIT_EXCEEDED
//
// MessageText:
//
// An ICMP hop limit exceeded error was received.
//
  {$EXTERNALSYM STATUS_HOPLIMIT_EXCEEDED}
  STATUS_HOPLIMIT_EXCEEDED         =  TNTStatus($C000A012);

//
// MessageId: STATUS_PROTOCOL_NOT_SUPPORTED
//
// MessageText:
//
// The protocol is not installed on the local machine.
//
  {$EXTERNALSYM STATUS_PROTOCOL_NOT_SUPPORTED}
  STATUS_PROTOCOL_NOT_SUPPORTED    =  TNTStatus($C000A013);

(*++

 MessageId's 0xa014 - 0xa07f (inclusive) are reserved for TCPIP errors.

--*)
//
// MessageId: STATUS_LOST_WRITEBEHIND_DATA_NETWORK_DISCONNECTED
//
// MessageText:
//
// {Delayed Write Failed}
// Windows was unable to save all the data for the file %hs; the data has been lost.
// This error may be caused by network connectivity issues. Please try to save this file elsewhere.
//
  {$EXTERNALSYM STATUS_LOST_WRITEBEHIND_DATA_NETWORK_DISCONNECTED}
  STATUS_LOST_WRITEBEHIND_DATA_NETWORK_DISCONNECTED =  TNTStatus($C000A080);

//
// MessageId: STATUS_LOST_WRITEBEHIND_DATA_NETWORK_SERVER_ERROR
//
// MessageText:
//
// {Delayed Write Failed}
// Windows was unable to save all the data for the file %hs; the data has been lost.
// This error was returned by the server on which the file exists. Please try to save this file elsewhere.
//
  {$EXTERNALSYM STATUS_LOST_WRITEBEHIND_DATA_NETWORK_SERVER_ERROR}
  STATUS_LOST_WRITEBEHIND_DATA_NETWORK_SERVER_ERROR =  TNTStatus($C000A081);

//
// MessageId: STATUS_LOST_WRITEBEHIND_DATA_LOCAL_DISK_ERROR
//
// MessageText:
//
// {Delayed Write Failed}
// Windows was unable to save all the data for the file %hs; the data has been lost.
// This error may be caused if the device has been removed or the media is write-protected.
//
  {$EXTERNALSYM STATUS_LOST_WRITEBEHIND_DATA_LOCAL_DISK_ERROR}
  STATUS_LOST_WRITEBEHIND_DATA_LOCAL_DISK_ERROR =  TNTStatus($C000A082);

//
// MessageId: STATUS_XML_PARSE_ERROR
//
// MessageText:
//
// Windows was unable to parse the requested XML data.
//
  {$EXTERNALSYM STATUS_XML_PARSE_ERROR}
  STATUS_XML_PARSE_ERROR           =  TNTStatus($C000A083);

//
// MessageId: STATUS_XMLDSIG_ERROR
//
// MessageText:
//
// An error was encountered while processing an XML digital signature.
//
  {$EXTERNALSYM STATUS_XMLDSIG_ERROR}
  STATUS_XMLDSIG_ERROR             =  TNTStatus($C000A084);

//
// MessageId: STATUS_WRONG_COMPARTMENT
//
// MessageText:
//
// Indicates that the caller made the connection request in the wrong routing compartment.
//
  {$EXTERNALSYM STATUS_WRONG_COMPARTMENT}
  STATUS_WRONG_COMPARTMENT         =  TNTStatus($C000A085);

//
// MessageId: STATUS_AUTHIP_FAILURE
//
// MessageText:
//
// Indicates that there was an AuthIP failure when attempting to connect to the remote host.
//
  {$EXTERNALSYM STATUS_AUTHIP_FAILURE}
  STATUS_AUTHIP_FAILURE            =  TNTStatus($C000A086);


//
//  Debugger error values
//

//
// MessageId: DBG_NO_STATE_CHANGE
//
// MessageText:
//
// Debugger did not perform a state change.
//
  {$EXTERNALSYM DBG_NO_STATE_CHANGE}
  DBG_NO_STATE_CHANGE              =  TNTStatus($C0010001);

//
// MessageId: DBG_APP_NOT_IDLE
//
// MessageText:
//
// Debugger has found the application is not idle.
//
  {$EXTERNALSYM DBG_APP_NOT_IDLE}
  DBG_APP_NOT_IDLE                 =  TNTStatus($C0010002);


//
//  RPC error values
//

//
// MessageId: RPC_NT_INVALID_STRING_BINDING
//
// MessageText:
//
// The string binding is invalid.
//
  {$EXTERNALSYM RPC_NT_INVALID_STRING_BINDING}
  RPC_NT_INVALID_STRING_BINDING    =  TNTStatus($C0020001);

//
// MessageId: RPC_NT_WRONG_KIND_OF_BINDING
//
// MessageText:
//
// The binding handle is not the correct type.
//
  {$EXTERNALSYM RPC_NT_WRONG_KIND_OF_BINDING}
  RPC_NT_WRONG_KIND_OF_BINDING     =  TNTStatus($C0020002);

//
// MessageId: RPC_NT_INVALID_BINDING
//
// MessageText:
//
// The binding handle is invalid.
//
  {$EXTERNALSYM RPC_NT_INVALID_BINDING}
  RPC_NT_INVALID_BINDING           =  TNTStatus($C0020003);

//
// MessageId: RPC_NT_PROTSEQ_NOT_SUPPORTED
//
// MessageText:
//
// The RPC protocol sequence is not supported.
//
  {$EXTERNALSYM RPC_NT_PROTSEQ_NOT_SUPPORTED}
  RPC_NT_PROTSEQ_NOT_SUPPORTED     =  TNTStatus($C0020004);

//
// MessageId: RPC_NT_INVALID_RPC_PROTSEQ
//
// MessageText:
//
// The RPC protocol sequence is invalid.
//
  {$EXTERNALSYM RPC_NT_INVALID_RPC_PROTSEQ}
  RPC_NT_INVALID_RPC_PROTSEQ       =  TNTStatus($C0020005);

//
// MessageId: RPC_NT_INVALID_STRING_UUID
//
// MessageText:
//
// The string UUID is invalid.
//
  {$EXTERNALSYM RPC_NT_INVALID_STRING_UUID}
  RPC_NT_INVALID_STRING_UUID       =  TNTStatus($C0020006);

//
// MessageId: RPC_NT_INVALID_ENDPOINT_FORMAT
//
// MessageText:
//
// The endpoint format is invalid.
//
  {$EXTERNALSYM RPC_NT_INVALID_ENDPOINT_FORMAT}
  RPC_NT_INVALID_ENDPOINT_FORMAT   =  TNTStatus($C0020007);

//
// MessageId: RPC_NT_INVALID_NET_ADDR
//
// MessageText:
//
// The network address is invalid.
//
  {$EXTERNALSYM RPC_NT_INVALID_NET_ADDR}
  RPC_NT_INVALID_NET_ADDR          =  TNTStatus($C0020008);

//
// MessageId: RPC_NT_NO_ENDPOINT_FOUND
//
// MessageText:
//
// No endpoint was found.
//
  {$EXTERNALSYM RPC_NT_NO_ENDPOINT_FOUND}
  RPC_NT_NO_ENDPOINT_FOUND         =  TNTStatus($C0020009);

//
// MessageId: RPC_NT_INVALID_TIMEOUT
//
// MessageText:
//
// The timeout value is invalid.
//
  {$EXTERNALSYM RPC_NT_INVALID_TIMEOUT}
  RPC_NT_INVALID_TIMEOUT           =  TNTStatus($C002000A);

//
// MessageId: RPC_NT_OBJECT_NOT_FOUND
//
// MessageText:
//
// The object UUID was not found.
//
  {$EXTERNALSYM RPC_NT_OBJECT_NOT_FOUND}
  RPC_NT_OBJECT_NOT_FOUND          =  TNTStatus($C002000B);

//
// MessageId: RPC_NT_ALREADY_REGISTERED
//
// MessageText:
//
// The object UUID has already been registered.
//
  {$EXTERNALSYM RPC_NT_ALREADY_REGISTERED}
  RPC_NT_ALREADY_REGISTERED        =  TNTStatus($C002000C);

//
// MessageId: RPC_NT_TYPE_ALREADY_REGISTERED
//
// MessageText:
//
// The type UUID has already been registered.
//
  {$EXTERNALSYM RPC_NT_TYPE_ALREADY_REGISTERED}
  RPC_NT_TYPE_ALREADY_REGISTERED   =  TNTStatus($C002000D);

//
// MessageId: RPC_NT_ALREADY_LISTENING
//
// MessageText:
//
// The RPC server is already listening.
//
  {$EXTERNALSYM RPC_NT_ALREADY_LISTENING}
  RPC_NT_ALREADY_LISTENING         =  TNTStatus($C002000E);

//
// MessageId: RPC_NT_NO_PROTSEQS_REGISTERED
//
// MessageText:
//
// No protocol sequences have been registered.
//
  {$EXTERNALSYM RPC_NT_NO_PROTSEQS_REGISTERED}
  RPC_NT_NO_PROTSEQS_REGISTERED    =  TNTStatus($C002000F);

//
// MessageId: RPC_NT_NOT_LISTENING
//
// MessageText:
//
// The RPC server is not listening.
//
  {$EXTERNALSYM RPC_NT_NOT_LISTENING}
  RPC_NT_NOT_LISTENING             =  TNTStatus($C0020010);

//
// MessageId: RPC_NT_UNKNOWN_MGR_TYPE
//
// MessageText:
//
// The manager type is unknown.
//
  {$EXTERNALSYM RPC_NT_UNKNOWN_MGR_TYPE}
  RPC_NT_UNKNOWN_MGR_TYPE          =  TNTStatus($C0020011);

//
// MessageId: RPC_NT_UNKNOWN_IF
//
// MessageText:
//
// The interface is unknown.
//
  {$EXTERNALSYM RPC_NT_UNKNOWN_IF}
  RPC_NT_UNKNOWN_IF                =  TNTStatus($C0020012);

//
// MessageId: RPC_NT_NO_BINDINGS
//
// MessageText:
//
// There are no bindings.
//
  {$EXTERNALSYM RPC_NT_NO_BINDINGS}
  RPC_NT_NO_BINDINGS               =  TNTStatus($C0020013);

//
// MessageId: RPC_NT_NO_PROTSEQS
//
// MessageText:
//
// There are no protocol sequences.
//
  {$EXTERNALSYM RPC_NT_NO_PROTSEQS}
  RPC_NT_NO_PROTSEQS               =  TNTStatus($C0020014);

//
// MessageId: RPC_NT_CANT_CREATE_ENDPOINT
//
// MessageText:
//
// The endpoint cannot be created.
//
  {$EXTERNALSYM RPC_NT_CANT_CREATE_ENDPOINT}
  RPC_NT_CANT_CREATE_ENDPOINT      =  TNTStatus($C0020015);

//
// MessageId: RPC_NT_OUT_OF_RESOURCES
//
// MessageText:
//
// Not enough resources are available to complete this operation.
//
  {$EXTERNALSYM RPC_NT_OUT_OF_RESOURCES}
  RPC_NT_OUT_OF_RESOURCES          =  TNTStatus($C0020016);

//
// MessageId: RPC_NT_SERVER_UNAVAILABLE
//
// MessageText:
//
// The RPC server is unavailable.
//
  {$EXTERNALSYM RPC_NT_SERVER_UNAVAILABLE}
  RPC_NT_SERVER_UNAVAILABLE        =  TNTStatus($C0020017);

//
// MessageId: RPC_NT_SERVER_TOO_BUSY
//
// MessageText:
//
// The RPC server is too busy to complete this operation.
//
  {$EXTERNALSYM RPC_NT_SERVER_TOO_BUSY}
  RPC_NT_SERVER_TOO_BUSY           =  TNTStatus($C0020018);

//
// MessageId: RPC_NT_INVALID_NETWORK_OPTIONS
//
// MessageText:
//
// The network options are invalid.
//
  {$EXTERNALSYM RPC_NT_INVALID_NETWORK_OPTIONS}
  RPC_NT_INVALID_NETWORK_OPTIONS   =  TNTStatus($C0020019);

//
// MessageId: RPC_NT_NO_CALL_ACTIVE
//
// MessageText:
//
// There are no remote procedure calls active on this thread.
//
  {$EXTERNALSYM RPC_NT_NO_CALL_ACTIVE}
  RPC_NT_NO_CALL_ACTIVE            =  TNTStatus($C002001A);

//
// MessageId: RPC_NT_CALL_FAILED
//
// MessageText:
//
// The remote procedure call failed.
//
  {$EXTERNALSYM RPC_NT_CALL_FAILED}
  RPC_NT_CALL_FAILED               =  TNTStatus($C002001B);

//
// MessageId: RPC_NT_CALL_FAILED_DNE
//
// MessageText:
//
// The remote procedure call failed and did not execute.
//
  {$EXTERNALSYM RPC_NT_CALL_FAILED_DNE}
  RPC_NT_CALL_FAILED_DNE           =  TNTStatus($C002001C);

//
// MessageId: RPC_NT_PROTOCOL_ERROR
//
// MessageText:
//
// An RPC protocol error occurred.
//
  {$EXTERNALSYM RPC_NT_PROTOCOL_ERROR}
  RPC_NT_PROTOCOL_ERROR            =  TNTStatus($C002001D);

//
// MessageId: RPC_NT_UNSUPPORTED_TRANS_SYN
//
// MessageText:
//
// The transfer syntax is not supported by the RPC server.
//
  {$EXTERNALSYM RPC_NT_UNSUPPORTED_TRANS_SYN}
  RPC_NT_UNSUPPORTED_TRANS_SYN     =  TNTStatus($C002001F);

//
// MessageId: RPC_NT_UNSUPPORTED_TYPE
//
// MessageText:
//
// The type UUID is not supported.
//
  {$EXTERNALSYM RPC_NT_UNSUPPORTED_TYPE}
  RPC_NT_UNSUPPORTED_TYPE          =  TNTStatus($C0020021);

//
// MessageId: RPC_NT_INVALID_TAG
//
// MessageText:
//
// The tag is invalid.
//
  {$EXTERNALSYM RPC_NT_INVALID_TAG}
  RPC_NT_INVALID_TAG               =  TNTStatus($C0020022);

//
// MessageId: RPC_NT_INVALID_BOUND
//
// MessageText:
//
// The array bounds are invalid.
//
  {$EXTERNALSYM RPC_NT_INVALID_BOUND}
  RPC_NT_INVALID_BOUND             =  TNTStatus($C0020023);

//
// MessageId: RPC_NT_NO_ENTRY_NAME
//
// MessageText:
//
// The binding does not contain an entry name.
//
  {$EXTERNALSYM RPC_NT_NO_ENTRY_NAME}
  RPC_NT_NO_ENTRY_NAME             =  TNTStatus($C0020024);

//
// MessageId: RPC_NT_INVALID_NAME_SYNTAX
//
// MessageText:
//
// The name syntax is invalid.
//
  {$EXTERNALSYM RPC_NT_INVALID_NAME_SYNTAX}
  RPC_NT_INVALID_NAME_SYNTAX       =  TNTStatus($C0020025);

//
// MessageId: RPC_NT_UNSUPPORTED_NAME_SYNTAX
//
// MessageText:
//
// The name syntax is not supported.
//
  {$EXTERNALSYM RPC_NT_UNSUPPORTED_NAME_SYNTAX}
  RPC_NT_UNSUPPORTED_NAME_SYNTAX   =  TNTStatus($C0020026);

//
// MessageId: RPC_NT_UUID_NO_ADDRESS
//
// MessageText:
//
// No network address is available to use to construct a UUID.
//
  {$EXTERNALSYM RPC_NT_UUID_NO_ADDRESS}
  RPC_NT_UUID_NO_ADDRESS           =  TNTStatus($C0020028);

//
// MessageId: RPC_NT_DUPLICATE_ENDPOINT
//
// MessageText:
//
// The endpoint is a duplicate.
//
  {$EXTERNALSYM RPC_NT_DUPLICATE_ENDPOINT}
  RPC_NT_DUPLICATE_ENDPOINT        =  TNTStatus($C0020029);

//
// MessageId: RPC_NT_UNKNOWN_AUTHN_TYPE
//
// MessageText:
//
// The authentication type is unknown.
//
  {$EXTERNALSYM RPC_NT_UNKNOWN_AUTHN_TYPE}
  RPC_NT_UNKNOWN_AUTHN_TYPE        =  TNTStatus($C002002A);

//
// MessageId: RPC_NT_MAX_CALLS_TOO_SMALL
//
// MessageText:
//
// The maximum number of calls is too small.
//
  {$EXTERNALSYM RPC_NT_MAX_CALLS_TOO_SMALL}
  RPC_NT_MAX_CALLS_TOO_SMALL       =  TNTStatus($C002002B);

//
// MessageId: RPC_NT_STRING_TOO_LONG
//
// MessageText:
//
// The string is too long.
//
  {$EXTERNALSYM RPC_NT_STRING_TOO_LONG}
  RPC_NT_STRING_TOO_LONG           =  TNTStatus($C002002C);

//
// MessageId: RPC_NT_PROTSEQ_NOT_FOUND
//
// MessageText:
//
// The RPC protocol sequence was not found.
//
  {$EXTERNALSYM RPC_NT_PROTSEQ_NOT_FOUND}
  RPC_NT_PROTSEQ_NOT_FOUND         =  TNTStatus($C002002D);

//
// MessageId: RPC_NT_PROCNUM_OUT_OF_RANGE
//
// MessageText:
//
// The procedure number is out of range.
//
  {$EXTERNALSYM RPC_NT_PROCNUM_OUT_OF_RANGE}
  RPC_NT_PROCNUM_OUT_OF_RANGE      =  TNTStatus($C002002E);

//
// MessageId: RPC_NT_BINDING_HAS_NO_AUTH
//
// MessageText:
//
// The binding does not contain any authentication information.
//
  {$EXTERNALSYM RPC_NT_BINDING_HAS_NO_AUTH}
  RPC_NT_BINDING_HAS_NO_AUTH       =  TNTStatus($C002002F);

//
// MessageId: RPC_NT_UNKNOWN_AUTHN_SERVICE
//
// MessageText:
//
// The authentication service is unknown.
//
  {$EXTERNALSYM RPC_NT_UNKNOWN_AUTHN_SERVICE}
  RPC_NT_UNKNOWN_AUTHN_SERVICE     =  TNTStatus($C0020030);

//
// MessageId: RPC_NT_UNKNOWN_AUTHN_LEVEL
//
// MessageText:
//
// The authentication level is unknown.
//
  {$EXTERNALSYM RPC_NT_UNKNOWN_AUTHN_LEVEL}
  RPC_NT_UNKNOWN_AUTHN_LEVEL       =  TNTStatus($C0020031);

//
// MessageId: RPC_NT_INVALID_AUTH_IDENTITY
//
// MessageText:
//
// The security context is invalid.
//
  {$EXTERNALSYM RPC_NT_INVALID_AUTH_IDENTITY}
  RPC_NT_INVALID_AUTH_IDENTITY     =  TNTStatus($C0020032);

//
// MessageId: RPC_NT_UNKNOWN_AUTHZ_SERVICE
//
// MessageText:
//
// The authorization service is unknown.
//
  {$EXTERNALSYM RPC_NT_UNKNOWN_AUTHZ_SERVICE}
  RPC_NT_UNKNOWN_AUTHZ_SERVICE     =  TNTStatus($C0020033);

//
// MessageId: EPT_NT_INVALID_ENTRY
//
// MessageText:
//
// The entry is invalid.
//
  {$EXTERNALSYM EPT_NT_INVALID_ENTRY}
  EPT_NT_INVALID_ENTRY             =  TNTStatus($C0020034);

//
// MessageId: EPT_NT_CANT_PERFORM_OP
//
// MessageText:
//
// The operation cannot be performed.
//
  {$EXTERNALSYM EPT_NT_CANT_PERFORM_OP}
  EPT_NT_CANT_PERFORM_OP           =  TNTStatus($C0020035);

//
// MessageId: EPT_NT_NOT_REGISTERED
//
// MessageText:
//
// There are no more endpoints available from the endpoint mapper.
//
  {$EXTERNALSYM EPT_NT_NOT_REGISTERED}
  EPT_NT_NOT_REGISTERED            =  TNTStatus($C0020036);

//
// MessageId: RPC_NT_NOTHING_TO_EXPORT
//
// MessageText:
//
// No interfaces have been exported.
//
  {$EXTERNALSYM RPC_NT_NOTHING_TO_EXPORT}
  RPC_NT_NOTHING_TO_EXPORT         =  TNTStatus($C0020037);

//
// MessageId: RPC_NT_INCOMPLETE_NAME
//
// MessageText:
//
// The entry name is incomplete.
//
  {$EXTERNALSYM RPC_NT_INCOMPLETE_NAME}
  RPC_NT_INCOMPLETE_NAME           =  TNTStatus($C0020038);

//
// MessageId: RPC_NT_INVALID_VERS_OPTION
//
// MessageText:
//
// The version option is invalid.
//
  {$EXTERNALSYM RPC_NT_INVALID_VERS_OPTION}
  RPC_NT_INVALID_VERS_OPTION       =  TNTStatus($C0020039);

//
// MessageId: RPC_NT_NO_MORE_MEMBERS
//
// MessageText:
//
// There are no more members.
//
  {$EXTERNALSYM RPC_NT_NO_MORE_MEMBERS}
  RPC_NT_NO_MORE_MEMBERS           =  TNTStatus($C002003A);

//
// MessageId: RPC_NT_NOT_ALL_OBJS_UNEXPORTED
//
// MessageText:
//
// There is nothing to unexport.
//
  {$EXTERNALSYM RPC_NT_NOT_ALL_OBJS_UNEXPORTED}
  RPC_NT_NOT_ALL_OBJS_UNEXPORTED   =  TNTStatus($C002003B);

//
// MessageId: RPC_NT_INTERFACE_NOT_FOUND
//
// MessageText:
//
// The interface was not found.
//
  {$EXTERNALSYM RPC_NT_INTERFACE_NOT_FOUND}
  RPC_NT_INTERFACE_NOT_FOUND       =  TNTStatus($C002003C);

//
// MessageId: RPC_NT_ENTRY_ALREADY_EXISTS
//
// MessageText:
//
// The entry already exists.
//
  {$EXTERNALSYM RPC_NT_ENTRY_ALREADY_EXISTS}
  RPC_NT_ENTRY_ALREADY_EXISTS      =  TNTStatus($C002003D);

//
// MessageId: RPC_NT_ENTRY_NOT_FOUND
//
// MessageText:
//
// The entry is not found.
//
  {$EXTERNALSYM RPC_NT_ENTRY_NOT_FOUND}
  RPC_NT_ENTRY_NOT_FOUND           =  TNTStatus($C002003E);

//
// MessageId: RPC_NT_NAME_SERVICE_UNAVAILABLE
//
// MessageText:
//
// The name service is unavailable.
//
  {$EXTERNALSYM RPC_NT_NAME_SERVICE_UNAVAILABLE}
  RPC_NT_NAME_SERVICE_UNAVAILABLE  =  TNTStatus($C002003F);

//
// MessageId: RPC_NT_INVALID_NAF_ID
//
// MessageText:
//
// The network address family is invalid.
//
  {$EXTERNALSYM RPC_NT_INVALID_NAF_ID}
  RPC_NT_INVALID_NAF_ID            =  TNTStatus($C0020040);

//
// MessageId: RPC_NT_CANNOT_SUPPORT
//
// MessageText:
//
// The requested operation is not supported.
//
  {$EXTERNALSYM RPC_NT_CANNOT_SUPPORT}
  RPC_NT_CANNOT_SUPPORT            =  TNTStatus($C0020041);

//
// MessageId: RPC_NT_NO_CONTEXT_AVAILABLE
//
// MessageText:
//
// No security context is available to allow impersonation.
//
  {$EXTERNALSYM RPC_NT_NO_CONTEXT_AVAILABLE}
  RPC_NT_NO_CONTEXT_AVAILABLE      =  TNTStatus($C0020042);

//
// MessageId: RPC_NT_INTERNAL_ERROR
//
// MessageText:
//
// An internal error occurred in RPC.
//
  {$EXTERNALSYM RPC_NT_INTERNAL_ERROR}
  RPC_NT_INTERNAL_ERROR            =  TNTStatus($C0020043);

//
// MessageId: RPC_NT_ZERO_DIVIDE
//
// MessageText:
//
// The RPC server attempted an integer divide by zero.
//
  {$EXTERNALSYM RPC_NT_ZERO_DIVIDE}
  RPC_NT_ZERO_DIVIDE               =  TNTStatus($C0020044);

//
// MessageId: RPC_NT_ADDRESS_ERROR
//
// MessageText:
//
// An addressing error occurred in the RPC server.
//
  {$EXTERNALSYM RPC_NT_ADDRESS_ERROR}
  RPC_NT_ADDRESS_ERROR             =  TNTStatus($C0020045);

//
// MessageId: RPC_NT_FP_DIV_ZERO
//
// MessageText:
//
// A floating point operation at the RPC server caused a divide by zero.
//
  {$EXTERNALSYM RPC_NT_FP_DIV_ZERO}
  RPC_NT_FP_DIV_ZERO               =  TNTStatus($C0020046);

//
// MessageId: RPC_NT_FP_UNDERFLOW
//
// MessageText:
//
// A floating point underflow occurred at the RPC server.
//
  {$EXTERNALSYM RPC_NT_FP_UNDERFLOW}
  RPC_NT_FP_UNDERFLOW              =  TNTStatus($C0020047);

//
// MessageId: RPC_NT_FP_OVERFLOW
//
// MessageText:
//
// A floating point overflow occurred at the RPC server.
//
  {$EXTERNALSYM RPC_NT_FP_OVERFLOW}
  RPC_NT_FP_OVERFLOW               =  TNTStatus($C0020048);

//
// MessageId: RPC_NT_NO_MORE_ENTRIES
//
// MessageText:
//
// The list of RPC servers available for auto-handle binding has been exhausted.
//
  {$EXTERNALSYM RPC_NT_NO_MORE_ENTRIES}
  RPC_NT_NO_MORE_ENTRIES           =  TNTStatus($C0030001);

//
// MessageId: RPC_NT_SS_CHAR_TRANS_OPEN_FAIL
//
// MessageText:
//
// The file designated by DCERPCCHARTRANS cannot be opened.
//
  {$EXTERNALSYM RPC_NT_SS_CHAR_TRANS_OPEN_FAIL}
  RPC_NT_SS_CHAR_TRANS_OPEN_FAIL   =  TNTStatus($C0030002);

//
// MessageId: RPC_NT_SS_CHAR_TRANS_SHORT_FILE
//
// MessageText:
//
// The file containing the character translation table has fewer than 512 bytes.
//
  {$EXTERNALSYM RPC_NT_SS_CHAR_TRANS_SHORT_FILE}
  RPC_NT_SS_CHAR_TRANS_SHORT_FILE  =  TNTStatus($C0030003);

//
// MessageId: RPC_NT_SS_IN_NULL_CONTEXT
//
// MessageText:
//
// A null context handle is passed as an [in] parameter.
//
  {$EXTERNALSYM RPC_NT_SS_IN_NULL_CONTEXT}
  RPC_NT_SS_IN_NULL_CONTEXT        =  TNTStatus($C0030004);

//
// MessageId: RPC_NT_SS_CONTEXT_MISMATCH
//
// MessageText:
//
// The context handle does not match any known context handles.
//
  {$EXTERNALSYM RPC_NT_SS_CONTEXT_MISMATCH}
  RPC_NT_SS_CONTEXT_MISMATCH       =  TNTStatus($C0030005);

//
// MessageId: RPC_NT_SS_CONTEXT_DAMAGED
//
// MessageText:
//
// The context handle changed during a call.
//
  {$EXTERNALSYM RPC_NT_SS_CONTEXT_DAMAGED}
  RPC_NT_SS_CONTEXT_DAMAGED        =  TNTStatus($C0030006);

//
// MessageId: RPC_NT_SS_HANDLES_MISMATCH
//
// MessageText:
//
// The binding handles passed to a remote procedure call do not match.
//
  {$EXTERNALSYM RPC_NT_SS_HANDLES_MISMATCH}
  RPC_NT_SS_HANDLES_MISMATCH       =  TNTStatus($C0030007);

//
// MessageId: RPC_NT_SS_CANNOT_GET_CALL_HANDLE
//
// MessageText:
//
// The stub is unable to get the call handle.
//
  {$EXTERNALSYM RPC_NT_SS_CANNOT_GET_CALL_HANDLE}
  RPC_NT_SS_CANNOT_GET_CALL_HANDLE =  TNTStatus($C0030008);

//
// MessageId: RPC_NT_NULL_REF_POINTER
//
// MessageText:
//
// A null reference pointer was passed to the stub.
//
  {$EXTERNALSYM RPC_NT_NULL_REF_POINTER}
  RPC_NT_NULL_REF_POINTER          =  TNTStatus($C0030009);

//
// MessageId: RPC_NT_ENUM_VALUE_OUT_OF_RANGE
//
// MessageText:
//
// The enumeration value is out of range.
//
  {$EXTERNALSYM RPC_NT_ENUM_VALUE_OUT_OF_RANGE}
  RPC_NT_ENUM_VALUE_OUT_OF_RANGE   =  TNTStatus($C003000A);

//
// MessageId: RPC_NT_BYTE_COUNT_TOO_SMALL
//
// MessageText:
//
// The byte count is too small.
//
  {$EXTERNALSYM RPC_NT_BYTE_COUNT_TOO_SMALL}
  RPC_NT_BYTE_COUNT_TOO_SMALL      =  TNTStatus($C003000B);

//
// MessageId: RPC_NT_BAD_STUB_DATA
//
// MessageText:
//
// The stub received bad data.
//
  {$EXTERNALSYM RPC_NT_BAD_STUB_DATA}
  RPC_NT_BAD_STUB_DATA             =  TNTStatus($C003000C);

//
// MessageId: RPC_NT_CALL_IN_PROGRESS
//
// MessageText:
//
// A remote procedure call is already in progress for this thread.
//
  {$EXTERNALSYM RPC_NT_CALL_IN_PROGRESS}
  RPC_NT_CALL_IN_PROGRESS          =  TNTStatus($C0020049);

//
// MessageId: RPC_NT_NO_MORE_BINDINGS
//
// MessageText:
//
// There are no more bindings.
//
  {$EXTERNALSYM RPC_NT_NO_MORE_BINDINGS}
  RPC_NT_NO_MORE_BINDINGS          =  TNTStatus($C002004A);

//
// MessageId: RPC_NT_GROUP_MEMBER_NOT_FOUND
//
// MessageText:
//
// The group member was not found.
//
  {$EXTERNALSYM RPC_NT_GROUP_MEMBER_NOT_FOUND}
  RPC_NT_GROUP_MEMBER_NOT_FOUND    =  TNTStatus($C002004B);

//
// MessageId: EPT_NT_CANT_CREATE
//
// MessageText:
//
// The endpoint mapper database entry could not be created.
//
  {$EXTERNALSYM EPT_NT_CANT_CREATE}
  EPT_NT_CANT_CREATE               =  TNTStatus($C002004C);

//
// MessageId: RPC_NT_INVALID_OBJECT
//
// MessageText:
//
// The object UUID is the nil UUID.
//
  {$EXTERNALSYM RPC_NT_INVALID_OBJECT}
  RPC_NT_INVALID_OBJECT            =  TNTStatus($C002004D);

//
// MessageId: RPC_NT_NO_INTERFACES
//
// MessageText:
//
// No interfaces have been registered.
//
  {$EXTERNALSYM RPC_NT_NO_INTERFACES}
  RPC_NT_NO_INTERFACES             =  TNTStatus($C002004F);

//
// MessageId: RPC_NT_CALL_CANCELLED
//
// MessageText:
//
// The remote procedure call was cancelled.
//
  {$EXTERNALSYM RPC_NT_CALL_CANCELLED}
  RPC_NT_CALL_CANCELLED            =  TNTStatus($C0020050);

//
// MessageId: RPC_NT_BINDING_INCOMPLETE
//
// MessageText:
//
// The binding handle does not contain all required information.
//
  {$EXTERNALSYM RPC_NT_BINDING_INCOMPLETE}
  RPC_NT_BINDING_INCOMPLETE        =  TNTStatus($C0020051);

//
// MessageId: RPC_NT_COMM_FAILURE
//
// MessageText:
//
// A communications failure occurred during a remote procedure call.
//
  {$EXTERNALSYM RPC_NT_COMM_FAILURE}
  RPC_NT_COMM_FAILURE              =  TNTStatus($C0020052);

//
// MessageId: RPC_NT_UNSUPPORTED_AUTHN_LEVEL
//
// MessageText:
//
// The requested authentication level is not supported.
//
  {$EXTERNALSYM RPC_NT_UNSUPPORTED_AUTHN_LEVEL}
  RPC_NT_UNSUPPORTED_AUTHN_LEVEL   =  TNTStatus($C0020053);

//
// MessageId: RPC_NT_NO_PRINC_NAME
//
// MessageText:
//
// No principal name registered.
//
  {$EXTERNALSYM RPC_NT_NO_PRINC_NAME}
  RPC_NT_NO_PRINC_NAME             =  TNTStatus($C0020054);

//
// MessageId: RPC_NT_NOT_RPC_ERROR
//
// MessageText:
//
// The error specified is not a valid Windows RPC error code.
//
  {$EXTERNALSYM RPC_NT_NOT_RPC_ERROR}
  RPC_NT_NOT_RPC_ERROR             =  TNTStatus($C0020055);

//
// MessageId: RPC_NT_UUID_LOCAL_ONLY
//
// MessageText:
//
// A UUID that is valid only on this computer has been allocated.
//
  {$EXTERNALSYM RPC_NT_UUID_LOCAL_ONLY}
  RPC_NT_UUID_LOCAL_ONLY           =  TNTStatus($40020056);

//
// MessageId: RPC_NT_SEC_PKG_ERROR
//
// MessageText:
//
// A security package specific error occurred.
//
  {$EXTERNALSYM RPC_NT_SEC_PKG_ERROR}
  RPC_NT_SEC_PKG_ERROR             =  TNTStatus($C0020057);

//
// MessageId: RPC_NT_NOT_CANCELLED
//
// MessageText:
//
// Thread is not cancelled.
//
  {$EXTERNALSYM RPC_NT_NOT_CANCELLED}
  RPC_NT_NOT_CANCELLED             =  TNTStatus($C0020058);

//
// MessageId: RPC_NT_INVALID_ES_ACTION
//
// MessageText:
//
// Invalid operation on the encoding/decoding handle.
//
  {$EXTERNALSYM RPC_NT_INVALID_ES_ACTION}
  RPC_NT_INVALID_ES_ACTION         =  TNTStatus($C0030059);

//
// MessageId: RPC_NT_WRONG_ES_VERSION
//
// MessageText:
//
// Incompatible version of the serializing package.
//
  {$EXTERNALSYM RPC_NT_WRONG_ES_VERSION}
  RPC_NT_WRONG_ES_VERSION          =  TNTStatus($C003005A);

//
// MessageId: RPC_NT_WRONG_STUB_VERSION
//
// MessageText:
//
// Incompatible version of the RPC stub.
//
  {$EXTERNALSYM RPC_NT_WRONG_STUB_VERSION}
  RPC_NT_WRONG_STUB_VERSION        =  TNTStatus($C003005B);

//
// MessageId: RPC_NT_INVALID_PIPE_OBJECT
//
// MessageText:
//
// The RPC pipe object is invalid or corrupted.
//
  {$EXTERNALSYM RPC_NT_INVALID_PIPE_OBJECT}
  RPC_NT_INVALID_PIPE_OBJECT       =  TNTStatus($C003005C);

//
// MessageId: RPC_NT_INVALID_PIPE_OPERATION
//
// MessageText:
//
// An invalid operation was attempted on an RPC pipe object.
//
  {$EXTERNALSYM RPC_NT_INVALID_PIPE_OPERATION}
  RPC_NT_INVALID_PIPE_OPERATION    =  TNTStatus($C003005D);

//
// MessageId: RPC_NT_WRONG_PIPE_VERSION
//
// MessageText:
//
// Unsupported RPC pipe version.
//
  {$EXTERNALSYM RPC_NT_WRONG_PIPE_VERSION}
  RPC_NT_WRONG_PIPE_VERSION        =  TNTStatus($C003005E);

//
// MessageId: RPC_NT_PIPE_CLOSED
//
// MessageText:
//
// The RPC pipe object has already been closed.
//
  {$EXTERNALSYM RPC_NT_PIPE_CLOSED}
  RPC_NT_PIPE_CLOSED               =  TNTStatus($C003005F);

//
// MessageId: RPC_NT_PIPE_DISCIPLINE_ERROR
//
// MessageText:
//
// The RPC call completed before all pipes were processed.
//
  {$EXTERNALSYM RPC_NT_PIPE_DISCIPLINE_ERROR}
  RPC_NT_PIPE_DISCIPLINE_ERROR     =  TNTStatus($C0030060);

//
// MessageId: RPC_NT_PIPE_EMPTY
//
// MessageText:
//
// No more data is available from the RPC pipe.
//
  {$EXTERNALSYM RPC_NT_PIPE_EMPTY}
  RPC_NT_PIPE_EMPTY                =  TNTStatus($C0030061);

//
// MessageId: RPC_NT_INVALID_ASYNC_HANDLE
//
// MessageText:
//
// Invalid asynchronous remote procedure call handle.
//
  {$EXTERNALSYM RPC_NT_INVALID_ASYNC_HANDLE}
  RPC_NT_INVALID_ASYNC_HANDLE      =  TNTStatus($C0020062);

//
// MessageId: RPC_NT_INVALID_ASYNC_CALL
//
// MessageText:
//
// Invalid asynchronous RPC call handle for this operation.
//
  {$EXTERNALSYM RPC_NT_INVALID_ASYNC_CALL}
  RPC_NT_INVALID_ASYNC_CALL        =  TNTStatus($C0020063);

//
// MessageId: RPC_NT_PROXY_ACCESS_DENIED
//
// MessageText:
//
// Access to the HTTP proxy is denied.
//
  {$EXTERNALSYM RPC_NT_PROXY_ACCESS_DENIED}
  RPC_NT_PROXY_ACCESS_DENIED       =  TNTStatus($C0020064);

//
// MessageId: RPC_NT_SEND_INCOMPLETE
//
// MessageText:
//
// Some data remains to be sent in the request buffer.
//
  {$EXTERNALSYM RPC_NT_SEND_INCOMPLETE}
  RPC_NT_SEND_INCOMPLETE           =  TNTStatus($400200AF);


//
//  ACPI error values
//

//
// MessageId: STATUS_ACPI_INVALID_OPCODE
//
// MessageText:
//
// An attempt was made to run an invalid AML opcode
//
  {$EXTERNALSYM STATUS_ACPI_INVALID_OPCODE}
  STATUS_ACPI_INVALID_OPCODE       =  TNTStatus($C0140001);

//
// MessageId: STATUS_ACPI_STACK_OVERFLOW
//
// MessageText:
//
// The AML Interpreter Stack has overflowed
//
  {$EXTERNALSYM STATUS_ACPI_STACK_OVERFLOW}
  STATUS_ACPI_STACK_OVERFLOW       =  TNTStatus($C0140002);

//
// MessageId: STATUS_ACPI_ASSERT_FAILED
//
// MessageText:
//
// An inconsistent state has occurred
//
  {$EXTERNALSYM STATUS_ACPI_ASSERT_FAILED}
  STATUS_ACPI_ASSERT_FAILED        =  TNTStatus($C0140003);

//
// MessageId: STATUS_ACPI_INVALID_INDEX
//
// MessageText:
//
// An attempt was made to access an array outside of its bounds
//
  {$EXTERNALSYM STATUS_ACPI_INVALID_INDEX}
  STATUS_ACPI_INVALID_INDEX        =  TNTStatus($C0140004);

//
// MessageId: STATUS_ACPI_INVALID_ARGUMENT
//
// MessageText:
//
// A required argument was not specified
//
  {$EXTERNALSYM STATUS_ACPI_INVALID_ARGUMENT}
  STATUS_ACPI_INVALID_ARGUMENT     =  TNTStatus($C0140005);

//
// MessageId: STATUS_ACPI_FATAL
//
// MessageText:
//
// A fatal error has occurred
//
  {$EXTERNALSYM STATUS_ACPI_FATAL}
  STATUS_ACPI_FATAL                =  TNTStatus($C0140006);

//
// MessageId: STATUS_ACPI_INVALID_SUPERNAME
//
// MessageText:
//
// An invalid SuperName was specified
//
  {$EXTERNALSYM STATUS_ACPI_INVALID_SUPERNAME}
  STATUS_ACPI_INVALID_SUPERNAME    =  TNTStatus($C0140007);

//
// MessageId: STATUS_ACPI_INVALID_ARGTYPE
//
// MessageText:
//
// An argument with an incorrect type was specified
//
  {$EXTERNALSYM STATUS_ACPI_INVALID_ARGTYPE}
  STATUS_ACPI_INVALID_ARGTYPE      =  TNTStatus($C0140008);

//
// MessageId: STATUS_ACPI_INVALID_OBJTYPE
//
// MessageText:
//
// An object with an incorrect type was specified
//
  {$EXTERNALSYM STATUS_ACPI_INVALID_OBJTYPE}
  STATUS_ACPI_INVALID_OBJTYPE      =  TNTStatus($C0140009);

//
// MessageId: STATUS_ACPI_INVALID_TARGETTYPE
//
// MessageText:
//
// A target with an incorrect type was specified
//
  {$EXTERNALSYM STATUS_ACPI_INVALID_TARGETTYPE}
  STATUS_ACPI_INVALID_TARGETTYPE   =  TNTStatus($C014000A);

//
// MessageId: STATUS_ACPI_INCORRECT_ARGUMENT_COUNT
//
// MessageText:
//
// An incorrect number of arguments were specified
//
  {$EXTERNALSYM STATUS_ACPI_INCORRECT_ARGUMENT_COUNT}
  STATUS_ACPI_INCORRECT_ARGUMENT_COUNT =  TNTStatus($C014000B);

//
// MessageId: STATUS_ACPI_ADDRESS_NOT_MAPPED
//
// MessageText:
//
// An address failed to translate
//
  {$EXTERNALSYM STATUS_ACPI_ADDRESS_NOT_MAPPED}
  STATUS_ACPI_ADDRESS_NOT_MAPPED   =  TNTStatus($C014000C);

//
// MessageId: STATUS_ACPI_INVALID_EVENTTYPE
//
// MessageText:
//
// An incorrect event type was specified
//
  {$EXTERNALSYM STATUS_ACPI_INVALID_EVENTTYPE}
  STATUS_ACPI_INVALID_EVENTTYPE    =  TNTStatus($C014000D);

//
// MessageId: STATUS_ACPI_HANDLER_COLLISION
//
// MessageText:
//
// A handler for the target already exists
//
  {$EXTERNALSYM STATUS_ACPI_HANDLER_COLLISION}
  STATUS_ACPI_HANDLER_COLLISION    =  TNTStatus($C014000E);

//
// MessageId: STATUS_ACPI_INVALID_DATA
//
// MessageText:
//
// Invalid data for the target was specified
//
  {$EXTERNALSYM STATUS_ACPI_INVALID_DATA}
  STATUS_ACPI_INVALID_DATA         =  TNTStatus($C014000F);

//
// MessageId: STATUS_ACPI_INVALID_REGION
//
// MessageText:
//
// An invalid region for the target was specified
//
  {$EXTERNALSYM STATUS_ACPI_INVALID_REGION}
  STATUS_ACPI_INVALID_REGION       =  TNTStatus($C0140010);

//
// MessageId: STATUS_ACPI_INVALID_ACCESS_SIZE
//
// MessageText:
//
// An attempt was made to access a field outside of the defined range
//
  {$EXTERNALSYM STATUS_ACPI_INVALID_ACCESS_SIZE}
  STATUS_ACPI_INVALID_ACCESS_SIZE  =  TNTStatus($C0140011);

//
// MessageId: STATUS_ACPI_ACQUIRE_GLOBAL_LOCK
//
// MessageText:
//
// The Global system lock could not be acquired
//
  {$EXTERNALSYM STATUS_ACPI_ACQUIRE_GLOBAL_LOCK}
  STATUS_ACPI_ACQUIRE_GLOBAL_LOCK  =  TNTStatus($C0140012);

//
// MessageId: STATUS_ACPI_ALREADY_INITIALIZED
//
// MessageText:
//
// An attempt was made to reinitialize the ACPI subsystem
//
  {$EXTERNALSYM STATUS_ACPI_ALREADY_INITIALIZED}
  STATUS_ACPI_ALREADY_INITIALIZED  =  TNTStatus($C0140013);

//
// MessageId: STATUS_ACPI_NOT_INITIALIZED
//
// MessageText:
//
// The ACPI subsystem has not been initialized
//
  {$EXTERNALSYM STATUS_ACPI_NOT_INITIALIZED}
  STATUS_ACPI_NOT_INITIALIZED      =  TNTStatus($C0140014);

//
// MessageId: STATUS_ACPI_INVALID_MUTEX_LEVEL
//
// MessageText:
//
// An incorrect mutex was specified
//
  {$EXTERNALSYM STATUS_ACPI_INVALID_MUTEX_LEVEL}
  STATUS_ACPI_INVALID_MUTEX_LEVEL  =  TNTStatus($C0140015);

//
// MessageId: STATUS_ACPI_MUTEX_NOT_OWNED
//
// MessageText:
//
// The mutex is not currently owned
//
  {$EXTERNALSYM STATUS_ACPI_MUTEX_NOT_OWNED}
  STATUS_ACPI_MUTEX_NOT_OWNED      =  TNTStatus($C0140016);

//
// MessageId: STATUS_ACPI_MUTEX_NOT_OWNER
//
// MessageText:
//
// An attempt was made to access the mutex by a process that was not the owner
//
  {$EXTERNALSYM STATUS_ACPI_MUTEX_NOT_OWNER}
  STATUS_ACPI_MUTEX_NOT_OWNER      =  TNTStatus($C0140017);

//
// MessageId: STATUS_ACPI_RS_ACCESS
//
// MessageText:
//
// An error occurred during an access to Region Space
//
  {$EXTERNALSYM STATUS_ACPI_RS_ACCESS}
  STATUS_ACPI_RS_ACCESS            =  TNTStatus($C0140018);

//
// MessageId: STATUS_ACPI_INVALID_TABLE
//
// MessageText:
//
// An attempt was made to use an incorrect table
//
  {$EXTERNALSYM STATUS_ACPI_INVALID_TABLE}
  STATUS_ACPI_INVALID_TABLE        =  TNTStatus($C0140019);

//
// MessageId: STATUS_ACPI_REG_HANDLER_FAILED
//
// MessageText:
//
// The registration of an ACPI event failed
//
  {$EXTERNALSYM STATUS_ACPI_REG_HANDLER_FAILED}
  STATUS_ACPI_REG_HANDLER_FAILED   =  TNTStatus($C0140020);

//
// MessageId: STATUS_ACPI_POWER_REQUEST_FAILED
//
// MessageText:
//
// An ACPI Power Object failed to transition state
//
  {$EXTERNALSYM STATUS_ACPI_POWER_REQUEST_FAILED}
  STATUS_ACPI_POWER_REQUEST_FAILED =  TNTStatus($C0140021);

//
// Terminal Server specific Errors
//
//
// MessageId: STATUS_CTX_WINSTATION_NAME_INVALID
//
// MessageText:
//
// Session name %1 is invalid.
//
  {$EXTERNALSYM STATUS_CTX_WINSTATION_NAME_INVALID}
  STATUS_CTX_WINSTATION_NAME_INVALID =  TNTStatus($C00A0001);

//
// MessageId: STATUS_CTX_INVALID_PD
//
// MessageText:
//
// The protocol driver %1 is invalid.
//
  {$EXTERNALSYM STATUS_CTX_INVALID_PD}
  STATUS_CTX_INVALID_PD            =  TNTStatus($C00A0002);

//
// MessageId: STATUS_CTX_PD_NOT_FOUND
//
// MessageText:
//
// The protocol driver %1 was not found in the system path.
//
  {$EXTERNALSYM STATUS_CTX_PD_NOT_FOUND}
  STATUS_CTX_PD_NOT_FOUND          =  TNTStatus($C00A0003);

//
// MessageId: STATUS_CTX_CDM_CONNECT
//
// MessageText:
//
// The Client Drive Mapping Service Has Connected on Terminal Connection.
//
  {$EXTERNALSYM STATUS_CTX_CDM_CONNECT}
  STATUS_CTX_CDM_CONNECT           =  TNTStatus($400A0004);

//
// MessageId: STATUS_CTX_CDM_DISCONNECT
//
// MessageText:
//
// The Client Drive Mapping Service Has Disconnected on Terminal Connection.
//
  {$EXTERNALSYM STATUS_CTX_CDM_DISCONNECT}
  STATUS_CTX_CDM_DISCONNECT        =  TNTStatus($400A0005);

//
// MessageId: STATUS_CTX_CLOSE_PENDING
//
// MessageText:
//
// A close operation is pending on the Terminal Connection.
//
  {$EXTERNALSYM STATUS_CTX_CLOSE_PENDING}
  STATUS_CTX_CLOSE_PENDING         =  TNTStatus($C00A0006);

//
// MessageId: STATUS_CTX_NO_OUTBUF
//
// MessageText:
//
// There are no free output buffers available.
//
  {$EXTERNALSYM STATUS_CTX_NO_OUTBUF}
  STATUS_CTX_NO_OUTBUF             =  TNTStatus($C00A0007);

//
// MessageId: STATUS_CTX_MODEM_INF_NOT_FOUND
//
// MessageText:
//
// The MODEM.INF file was not found.
//
  {$EXTERNALSYM STATUS_CTX_MODEM_INF_NOT_FOUND}
  STATUS_CTX_MODEM_INF_NOT_FOUND   =  TNTStatus($C00A0008);

//
// MessageId: STATUS_CTX_INVALID_MODEMNAME
//
// MessageText:
//
// The modem (%1) was not found in MODEM.INF.
//
  {$EXTERNALSYM STATUS_CTX_INVALID_MODEMNAME}
  STATUS_CTX_INVALID_MODEMNAME     =  TNTStatus($C00A0009);

//
// MessageId: STATUS_CTX_RESPONSE_ERROR
//
// MessageText:
//
// The modem did not accept the command sent to it.
// Verify the configured modem name matches the attached modem.
//
  {$EXTERNALSYM STATUS_CTX_RESPONSE_ERROR}
  STATUS_CTX_RESPONSE_ERROR        =  TNTStatus($C00A000A);

//
// MessageId: STATUS_CTX_MODEM_RESPONSE_TIMEOUT
//
// MessageText:
//
// The modem did not respond to the command sent to it.
// Verify the modem is properly cabled and powered on.
//
  {$EXTERNALSYM STATUS_CTX_MODEM_RESPONSE_TIMEOUT}
  STATUS_CTX_MODEM_RESPONSE_TIMEOUT =  TNTStatus($C00A000B);

//
// MessageId: STATUS_CTX_MODEM_RESPONSE_NO_CARRIER
//
// MessageText:
//
// Carrier detect has failed or carrier has been dropped due to disconnect.
//
  {$EXTERNALSYM STATUS_CTX_MODEM_RESPONSE_NO_CARRIER}
  STATUS_CTX_MODEM_RESPONSE_NO_CARRIER =  TNTStatus($C00A000C);

//
// MessageId: STATUS_CTX_MODEM_RESPONSE_NO_DIALTONE
//
// MessageText:
//
// Dial tone not detected within required time.
// Verify phone cable is properly attached and functional.
//
  {$EXTERNALSYM STATUS_CTX_MODEM_RESPONSE_NO_DIALTONE}
  STATUS_CTX_MODEM_RESPONSE_NO_DIALTONE =  TNTStatus($C00A000D);

//
// MessageId: STATUS_CTX_MODEM_RESPONSE_BUSY
//
// MessageText:
//
// Busy signal detected at remote site on callback.
//
  {$EXTERNALSYM STATUS_CTX_MODEM_RESPONSE_BUSY}
  STATUS_CTX_MODEM_RESPONSE_BUSY   =  TNTStatus($C00A000E);

//
// MessageId: STATUS_CTX_MODEM_RESPONSE_VOICE
//
// MessageText:
//
// Voice detected at remote site on callback.
//
  {$EXTERNALSYM STATUS_CTX_MODEM_RESPONSE_VOICE}
  STATUS_CTX_MODEM_RESPONSE_VOICE  =  TNTStatus($C00A000F);

//
// MessageId: STATUS_CTX_TD_ERROR
//
// MessageText:
//
// Transport driver error
//
  {$EXTERNALSYM STATUS_CTX_TD_ERROR}
  STATUS_CTX_TD_ERROR              =  TNTStatus($C00A0010);

//
// MessageId: STATUS_CTX_LICENSE_CLIENT_INVALID
//
// MessageText:
//
// The client you are using is not licensed to use this system. Your logon request is denied.
//
  {$EXTERNALSYM STATUS_CTX_LICENSE_CLIENT_INVALID}
  STATUS_CTX_LICENSE_CLIENT_INVALID =  TNTStatus($C00A0012);

//
// MessageId: STATUS_CTX_LICENSE_NOT_AVAILABLE
//
// MessageText:
//
// The system has reached its licensed logon limit.
// Please try again later.
//
  {$EXTERNALSYM STATUS_CTX_LICENSE_NOT_AVAILABLE}
  STATUS_CTX_LICENSE_NOT_AVAILABLE =  TNTStatus($C00A0013);

//
// MessageId: STATUS_CTX_LICENSE_EXPIRED
//
// MessageText:
//
// The system license has expired. Your logon request is denied.
//
  {$EXTERNALSYM STATUS_CTX_LICENSE_EXPIRED}
  STATUS_CTX_LICENSE_EXPIRED       =  TNTStatus($C00A0014);

//
// MessageId: STATUS_CTX_WINSTATION_NOT_FOUND
//
// MessageText:
//
// The specified session cannot be found.
//
  {$EXTERNALSYM STATUS_CTX_WINSTATION_NOT_FOUND}
  STATUS_CTX_WINSTATION_NOT_FOUND  =  TNTStatus($C00A0015);

//
// MessageId: STATUS_CTX_WINSTATION_NAME_COLLISION
//
// MessageText:
//
// The specified session name is already in use.
//
  {$EXTERNALSYM STATUS_CTX_WINSTATION_NAME_COLLISION}
  STATUS_CTX_WINSTATION_NAME_COLLISION =  TNTStatus($C00A0016);

//
// MessageId: STATUS_CTX_WINSTATION_BUSY
//
// MessageText:
//
// The requested operation cannot be completed because the Terminal Connection is currently busy processing a connect, disconnect, reset, or delete operation.
//
  {$EXTERNALSYM STATUS_CTX_WINSTATION_BUSY}
  STATUS_CTX_WINSTATION_BUSY       =  TNTStatus($C00A0017);

//
// MessageId: STATUS_CTX_BAD_VIDEO_MODE
//
// MessageText:
//
// An attempt has been made to connect to a session whose video mode is not supported by the current client.
//
  {$EXTERNALSYM STATUS_CTX_BAD_VIDEO_MODE}
  STATUS_CTX_BAD_VIDEO_MODE        =  TNTStatus($C00A0018);

//
// MessageId: STATUS_CTX_GRAPHICS_INVALID
//
// MessageText:
//
// The application attempted to enable DOS graphics mode.
// DOS graphics mode is not supported.
//
  {$EXTERNALSYM STATUS_CTX_GRAPHICS_INVALID}
  STATUS_CTX_GRAPHICS_INVALID      =  TNTStatus($C00A0022);

//
// MessageId: STATUS_CTX_NOT_CONSOLE
//
// MessageText:
//
// The requested operation can be performed only on the system console.
// This is most often the result of a driver or system DLL requiring direct console access.
//
  {$EXTERNALSYM STATUS_CTX_NOT_CONSOLE}
  STATUS_CTX_NOT_CONSOLE           =  TNTStatus($C00A0024);

//
// MessageId: STATUS_CTX_CLIENT_QUERY_TIMEOUT
//
// MessageText:
//
// The client failed to respond to the server connect message.
//
  {$EXTERNALSYM STATUS_CTX_CLIENT_QUERY_TIMEOUT}
  STATUS_CTX_CLIENT_QUERY_TIMEOUT  =  TNTStatus($C00A0026);

//
// MessageId: STATUS_CTX_CONSOLE_DISCONNECT
//
// MessageText:
//
// Disconnecting the console session is not supported.
//
  {$EXTERNALSYM STATUS_CTX_CONSOLE_DISCONNECT}
  STATUS_CTX_CONSOLE_DISCONNECT    =  TNTStatus($C00A0027);

//
// MessageId: STATUS_CTX_CONSOLE_CONNECT
//
// MessageText:
//
// Reconnecting a disconnected session to the console is not supported.
//
  {$EXTERNALSYM STATUS_CTX_CONSOLE_CONNECT}
  STATUS_CTX_CONSOLE_CONNECT       =  TNTStatus($C00A0028);

//
// MessageId: STATUS_CTX_SHADOW_DENIED
//
// MessageText:
//
// The request to control another session remotely was denied.
//
  {$EXTERNALSYM STATUS_CTX_SHADOW_DENIED}
  STATUS_CTX_SHADOW_DENIED         =  TNTStatus($C00A002A);

//
// MessageId: STATUS_CTX_WINSTATION_ACCESS_DENIED
//
// MessageText:
//
// A process has requested access to a session, but has not been granted those access rights.
//
  {$EXTERNALSYM STATUS_CTX_WINSTATION_ACCESS_DENIED}
  STATUS_CTX_WINSTATION_ACCESS_DENIED =  TNTStatus($C00A002B);

//
// MessageId: STATUS_CTX_INVALID_WD
//
// MessageText:
//
// The Terminal Connection driver %1 is invalid.
//
  {$EXTERNALSYM STATUS_CTX_INVALID_WD}
  STATUS_CTX_INVALID_WD            =  TNTStatus($C00A002E);

//
// MessageId: STATUS_CTX_WD_NOT_FOUND
//
// MessageText:
//
// The Terminal Connection driver %1 was not found in the system path.
//
  {$EXTERNALSYM STATUS_CTX_WD_NOT_FOUND}
  STATUS_CTX_WD_NOT_FOUND          =  TNTStatus($C00A002F);

//
// MessageId: STATUS_CTX_SHADOW_INVALID
//
// MessageText:
//
// The requested session cannot be controlled remotely.
// You cannot control your own session, a session that is trying to control your session,
// a session that has no user logged on, nor control other sessions from the console.
//
  {$EXTERNALSYM STATUS_CTX_SHADOW_INVALID}
  STATUS_CTX_SHADOW_INVALID        =  TNTStatus($C00A0030);

//
// MessageId: STATUS_CTX_SHADOW_DISABLED
//
// MessageText:
//
// The requested session is not configured to allow remote control.
//
  {$EXTERNALSYM STATUS_CTX_SHADOW_DISABLED}
  STATUS_CTX_SHADOW_DISABLED       =  TNTStatus($C00A0031);

//
// MessageId: STATUS_RDP_PROTOCOL_ERROR
//
// MessageText:
//
// The RDP protocol component %2 detected an error in the protocol stream and has disconnected the client.
//
  {$EXTERNALSYM STATUS_RDP_PROTOCOL_ERROR}
  STATUS_RDP_PROTOCOL_ERROR        =  TNTStatus($C00A0032);

//
// MessageId: STATUS_CTX_CLIENT_LICENSE_NOT_SET
//
// MessageText:
//
// Your request to connect to this Terminal server has been rejected.
// Your Terminal Server Client license number has not been entered for this copy of the Terminal Client.
// Please call your system administrator for help in entering a valid, unique license number for this Terminal Server Client.
// Click OK to continue.
//
  {$EXTERNALSYM STATUS_CTX_CLIENT_LICENSE_NOT_SET}
  STATUS_CTX_CLIENT_LICENSE_NOT_SET =  TNTStatus($C00A0033);

//
// MessageId: STATUS_CTX_CLIENT_LICENSE_IN_USE
//
// MessageText:
//
// Your request to connect to this Terminal server has been rejected.
// Your Terminal Server Client license number is currently being used by another user.
// Please call your system administrator to obtain a new copy of the Terminal Server Client with a valid, unique license number.
// Click OK to continue.
//
  {$EXTERNALSYM STATUS_CTX_CLIENT_LICENSE_IN_USE}
  STATUS_CTX_CLIENT_LICENSE_IN_USE =  TNTStatus($C00A0034);

//
// MessageId: STATUS_CTX_SHADOW_ENDED_BY_MODE_CHANGE
//
// MessageText:
//
// The remote control of the console was terminated because the display mode was changed. Changing the display mode in a remote control session is not supported.
//
  {$EXTERNALSYM STATUS_CTX_SHADOW_ENDED_BY_MODE_CHANGE}
  STATUS_CTX_SHADOW_ENDED_BY_MODE_CHANGE =  TNTStatus($C00A0035);

//
// MessageId: STATUS_CTX_SHADOW_NOT_RUNNING
//
// MessageText:
//
// Remote control could not be terminated because the specified session is not currently being remotely controlled.
//
  {$EXTERNALSYM STATUS_CTX_SHADOW_NOT_RUNNING}
  STATUS_CTX_SHADOW_NOT_RUNNING    =  TNTStatus($C00A0036);

//
// MessageId: STATUS_CTX_LOGON_DISABLED
//
// MessageText:
//
// Your interactive logon privilege has been disabled.
// Please contact your system administrator.
//
  {$EXTERNALSYM STATUS_CTX_LOGON_DISABLED}
  STATUS_CTX_LOGON_DISABLED        =  TNTStatus($C00A0037);

//
// MessageId: STATUS_CTX_SECURITY_LAYER_ERROR
//
// MessageText:
//
// The Terminal Server security layer detected an error in the protocol stream and has disconnected the client.
//
  {$EXTERNALSYM STATUS_CTX_SECURITY_LAYER_ERROR}
  STATUS_CTX_SECURITY_LAYER_ERROR  =  TNTStatus($C00A0038);

//
// MessageId: STATUS_TS_INCOMPATIBLE_SESSIONS
//
// MessageText:
//
// The target session is incompatible with the current session.
//
  {$EXTERNALSYM STATUS_TS_INCOMPATIBLE_SESSIONS}
  STATUS_TS_INCOMPATIBLE_SESSIONS  =  TNTStatus($C00A0039);


//
//  IO error values
//

//
// MessageId: STATUS_PNP_BAD_MPS_TABLE
//
// MessageText:
//
// A device is missing in the system BIOS MPS table. This device will not be used.
// Please contact your system vendor for system BIOS update.
//
  {$EXTERNALSYM STATUS_PNP_BAD_MPS_TABLE}
  STATUS_PNP_BAD_MPS_TABLE         =  TNTStatus($C0040035);

//
// MessageId: STATUS_PNP_TRANSLATION_FAILED
//
// MessageText:
//
// A translator failed to translate resources.
//
  {$EXTERNALSYM STATUS_PNP_TRANSLATION_FAILED}
  STATUS_PNP_TRANSLATION_FAILED    =  TNTStatus($C0040036);

//
// MessageId: STATUS_PNP_IRQ_TRANSLATION_FAILED
//
// MessageText:
//
// A IRQ translator failed to translate resources.
//
  {$EXTERNALSYM STATUS_PNP_IRQ_TRANSLATION_FAILED}
  STATUS_PNP_IRQ_TRANSLATION_FAILED =  TNTStatus($C0040037);

//
// MessageId: STATUS_PNP_INVALID_ID
//
// MessageText:
//
// Driver %2 returned invalid ID for a child device (%3).
//
  {$EXTERNALSYM STATUS_PNP_INVALID_ID}
  STATUS_PNP_INVALID_ID            =  TNTStatus($C0040038);

//
// MessageId: STATUS_IO_REISSUE_AS_CACHED
//
// MessageText:
//
// Reissue the given operation as a cached IO operation
//
  {$EXTERNALSYM STATUS_IO_REISSUE_AS_CACHED}
  STATUS_IO_REISSUE_AS_CACHED      =  TNTStatus($C0040039);


//
//  MUI error values
//

//
// MessageId: STATUS_MUI_FILE_NOT_FOUND
//
// MessageText:
//
// The resource loader failed to find MUI file.
//
  {$EXTERNALSYM STATUS_MUI_FILE_NOT_FOUND}
  STATUS_MUI_FILE_NOT_FOUND        =  TNTStatus($C00B0001);

//
// MessageId: STATUS_MUI_INVALID_FILE
//
// MessageText:
//
// The resource loader failed to load MUI file because the file fail to pass validation.
//
  {$EXTERNALSYM STATUS_MUI_INVALID_FILE}
  STATUS_MUI_INVALID_FILE          =  TNTStatus($C00B0002);

//
// MessageId: STATUS_MUI_INVALID_RC_CONFIG
//
// MessageText:
//
// The RC Manifest is corrupted with garbage data or unsupported version or missing required item.
//
  {$EXTERNALSYM STATUS_MUI_INVALID_RC_CONFIG}
  STATUS_MUI_INVALID_RC_CONFIG     =  TNTStatus($C00B0003);

//
// MessageId: STATUS_MUI_INVALID_LOCALE_NAME
//
// MessageText:
//
// The RC Manifest has invalid culture name.
//
  {$EXTERNALSYM STATUS_MUI_INVALID_LOCALE_NAME}
  STATUS_MUI_INVALID_LOCALE_NAME   =  TNTStatus($C00B0004);

//
// MessageId: STATUS_MUI_INVALID_ULTIMATEFALLBACK_NAME
//
// MessageText:
//
// The RC Manifest has invalid ultimatefallback name.
//
  {$EXTERNALSYM STATUS_MUI_INVALID_ULTIMATEFALLBACK_NAME}
  STATUS_MUI_INVALID_ULTIMATEFALLBACK_NAME =  TNTStatus($C00B0005);

//
// MessageId: STATUS_MUI_FILE_NOT_LOADED
//
// MessageText:
//
// The resource loader cache doesn't have loaded MUI entry.
//
  {$EXTERNALSYM STATUS_MUI_FILE_NOT_LOADED}
  STATUS_MUI_FILE_NOT_LOADED       =  TNTStatus($C00B0006);

//
// MessageId: STATUS_RESOURCE_ENUM_USER_STOP
//
// MessageText:
//
// User stopped resource enumeration.
//
  {$EXTERNALSYM STATUS_RESOURCE_ENUM_USER_STOP}
  STATUS_RESOURCE_ENUM_USER_STOP   =  TNTStatus($C00B0007);


//
//  Filter Manager error values
//

//
//  Translation macro for converting:
//     HRESULT --> TNTStatus
//

{$EXTERNALSYM FILTER_FLT_NTSTATUS_FROM_HRESULT}
function FILTER_FLT_NTSTATUS_FROM_HRESULT(x: HRESULT): TNTStatus;

const
//
// MessageId: STATUS_FLT_NO_HANDLER_DEFINED
//
// MessageText:
//
// A handler was not defined by the filter for this operation.
//
  {$EXTERNALSYM STATUS_FLT_NO_HANDLER_DEFINED}
  STATUS_FLT_NO_HANDLER_DEFINED    =  TNTStatus($C01C0001);

//
// MessageId: STATUS_FLT_CONTEXT_ALREADY_DEFINED
//
// MessageText:
//
// A context is already defined for this object.
//
  {$EXTERNALSYM STATUS_FLT_CONTEXT_ALREADY_DEFINED}
  STATUS_FLT_CONTEXT_ALREADY_DEFINED =  TNTStatus($C01C0002);

//
// MessageId: STATUS_FLT_INVALID_ASYNCHRONOUS_REQUEST
//
// MessageText:
//
// Asynchronous requests are not valid for this operation.
//
  {$EXTERNALSYM STATUS_FLT_INVALID_ASYNCHRONOUS_REQUEST}
  STATUS_FLT_INVALID_ASYNCHRONOUS_REQUEST =  TNTStatus($C01C0003);

//
// MessageId: STATUS_FLT_DISALLOW_FAST_IO
//
// MessageText:
//
// Internal error code used by the filter manager to determine if a fastio operation
// should be forced down the IRP path.  Mini-filters should never return this value.
//
  {$EXTERNALSYM STATUS_FLT_DISALLOW_FAST_IO}
  STATUS_FLT_DISALLOW_FAST_IO      =  TNTStatus($C01C0004);

//
// MessageId: STATUS_FLT_INVALID_NAME_REQUEST
//
// MessageText:
//
// An invalid name request was made.  The name requested cannot be retrieved at this time.
//
  {$EXTERNALSYM STATUS_FLT_INVALID_NAME_REQUEST}
  STATUS_FLT_INVALID_NAME_REQUEST  =  TNTStatus($C01C0005);

//
// MessageId: STATUS_FLT_NOT_SAFE_TO_POST_OPERATION
//
// MessageText:
//
// Posting this operation to a worker thread for further processing is not safe
// at this time because it could lead to a system deadlock.
//
  {$EXTERNALSYM STATUS_FLT_NOT_SAFE_TO_POST_OPERATION}
  STATUS_FLT_NOT_SAFE_TO_POST_OPERATION =  TNTStatus($C01C0006);

//
// MessageId: STATUS_FLT_NOT_INITIALIZED
//
// MessageText:
//
// The Filter Manager was not initialized when a filter tried to register.  Make
// sure that the Filter Manager is getting loaded as a driver.
//
  {$EXTERNALSYM STATUS_FLT_NOT_INITIALIZED}
  STATUS_FLT_NOT_INITIALIZED       =  TNTStatus($C01C0007);

//
// MessageId: STATUS_FLT_FILTER_NOT_READY
//
// MessageText:
//
// The filter is not ready for attachment to volumes because it has not finished
// initializing (FltStartFiltering has not been called).
//
  {$EXTERNALSYM STATUS_FLT_FILTER_NOT_READY}
  STATUS_FLT_FILTER_NOT_READY      =  TNTStatus($C01C0008);

//
// MessageId: STATUS_FLT_POST_OPERATION_CLEANUP
//
// MessageText:
//
// The filter must cleanup any operation specific context at this time because
// it is being removed from the system before the operation is completed by
// the lower drivers.
//
  {$EXTERNALSYM STATUS_FLT_POST_OPERATION_CLEANUP}
  STATUS_FLT_POST_OPERATION_CLEANUP =  TNTStatus($C01C0009);

//
// MessageId: STATUS_FLT_INTERNAL_ERROR
//
// MessageText:
//
// The Filter Manager had an internal error from which it cannot recover,
// therefore the operation has been failed.  This is usually the result
// of a filter returning an invalid value from a pre-operation callback.
//
  {$EXTERNALSYM STATUS_FLT_INTERNAL_ERROR}
  STATUS_FLT_INTERNAL_ERROR        =  TNTStatus($C01C000A);

//
// MessageId: STATUS_FLT_DELETING_OBJECT
//
// MessageText:
//
// The object specified for this action is in the process of being
// deleted, therefore the action requested cannot be completed at
// this time.
//
  {$EXTERNALSYM STATUS_FLT_DELETING_OBJECT}
  STATUS_FLT_DELETING_OBJECT       =  TNTStatus($C01C000B);

//
// MessageId: STATUS_FLT_MUST_BE_NONPAGED_POOL
//
// MessageText:
//
// Non-paged pool must be used for this type of context.
//
  {$EXTERNALSYM STATUS_FLT_MUST_BE_NONPAGED_POOL}
  STATUS_FLT_MUST_BE_NONPAGED_POOL =  TNTStatus($C01C000C);

//
// MessageId: STATUS_FLT_DUPLICATE_ENTRY
//
// MessageText:
//
// A duplicate handler definition has been provided for an operation.
//
  {$EXTERNALSYM STATUS_FLT_DUPLICATE_ENTRY}
  STATUS_FLT_DUPLICATE_ENTRY       =  TNTStatus($C01C000D);

//
// MessageId: STATUS_FLT_CBDQ_DISABLED
//
// MessageText:
//
// The callback data queue has been disabled.
//
  {$EXTERNALSYM STATUS_FLT_CBDQ_DISABLED}
  STATUS_FLT_CBDQ_DISABLED         =  TNTStatus($C01C000E);

//
// MessageId: STATUS_FLT_DO_NOT_ATTACH
//
// MessageText:
//
// Do not attach the filter to the volume at this time.
//
  {$EXTERNALSYM STATUS_FLT_DO_NOT_ATTACH}
  STATUS_FLT_DO_NOT_ATTACH         =  TNTStatus($C01C000F);

//
// MessageId: STATUS_FLT_DO_NOT_DETACH
//
// MessageText:
//
// Do not detach the filter from the volume at this time.
//
  {$EXTERNALSYM STATUS_FLT_DO_NOT_DETACH}
  STATUS_FLT_DO_NOT_DETACH         =  TNTStatus($C01C0010);

//
// MessageId: STATUS_FLT_INSTANCE_ALTITUDE_COLLISION
//
// MessageText:
//
// An instance already exists at this altitude on the volume specified.
//
  {$EXTERNALSYM STATUS_FLT_INSTANCE_ALTITUDE_COLLISION}
  STATUS_FLT_INSTANCE_ALTITUDE_COLLISION =  TNTStatus($C01C0011);

//
// MessageId: STATUS_FLT_INSTANCE_NAME_COLLISION
//
// MessageText:
//
// An instance already exists with this name on the volume specified.
//
  {$EXTERNALSYM STATUS_FLT_INSTANCE_NAME_COLLISION}
  STATUS_FLT_INSTANCE_NAME_COLLISION =  TNTStatus($C01C0012);

//
// MessageId: STATUS_FLT_FILTER_NOT_FOUND
//
// MessageText:
//
// The system could not find the filter specified.
//
  {$EXTERNALSYM STATUS_FLT_FILTER_NOT_FOUND}
  STATUS_FLT_FILTER_NOT_FOUND      =  TNTStatus($C01C0013);

//
// MessageId: STATUS_FLT_VOLUME_NOT_FOUND
//
// MessageText:
//
// The system could not find the volume specified.
//
  {$EXTERNALSYM STATUS_FLT_VOLUME_NOT_FOUND}
  STATUS_FLT_VOLUME_NOT_FOUND      =  TNTStatus($C01C0014);

//
// MessageId: STATUS_FLT_INSTANCE_NOT_FOUND
//
// MessageText:
//
// The system could not find the instance specified.
//
  {$EXTERNALSYM STATUS_FLT_INSTANCE_NOT_FOUND}
  STATUS_FLT_INSTANCE_NOT_FOUND    =  TNTStatus($C01C0015);

//
// MessageId: STATUS_FLT_CONTEXT_ALLOCATION_NOT_FOUND
//
// MessageText:
//
// No registered context allocation definition was found for the given request.
//
  {$EXTERNALSYM STATUS_FLT_CONTEXT_ALLOCATION_NOT_FOUND}
  STATUS_FLT_CONTEXT_ALLOCATION_NOT_FOUND =  TNTStatus($C01C0016);

//
// MessageId: STATUS_FLT_INVALID_CONTEXT_REGISTRATION
//
// MessageText:
//
// An invalid parameter was specified during context registration.
//
  {$EXTERNALSYM STATUS_FLT_INVALID_CONTEXT_REGISTRATION}
  STATUS_FLT_INVALID_CONTEXT_REGISTRATION =  TNTStatus($C01C0017);

//
// MessageId: STATUS_FLT_NAME_CACHE_MISS
//
// MessageText:
//
// The name requested was not found in Filter Manager's name cache and could not be retrieved from the file system.
//
  {$EXTERNALSYM STATUS_FLT_NAME_CACHE_MISS}
  STATUS_FLT_NAME_CACHE_MISS       =  TNTStatus($C01C0018);

//
// MessageId: STATUS_FLT_NO_DEVICE_OBJECT
//
// MessageText:
//
// The requested device object does not exist for the given volume.
//
  {$EXTERNALSYM STATUS_FLT_NO_DEVICE_OBJECT}
  STATUS_FLT_NO_DEVICE_OBJECT      =  TNTStatus($C01C0019);

//
// MessageId: STATUS_FLT_VOLUME_ALREADY_MOUNTED
//
// MessageText:
//
// The specified volume is already mounted.
//
  {$EXTERNALSYM STATUS_FLT_VOLUME_ALREADY_MOUNTED}
  STATUS_FLT_VOLUME_ALREADY_MOUNTED =  TNTStatus($C01C001A);

//
// MessageId: STATUS_FLT_ALREADY_ENLISTED
//
// MessageText:
//
// The specified Transaction Context is already enlisted in a transaction
//
  {$EXTERNALSYM STATUS_FLT_ALREADY_ENLISTED}
  STATUS_FLT_ALREADY_ENLISTED      =  TNTStatus($C01C001B);

//
// MessageId: STATUS_FLT_CONTEXT_ALREADY_LINKED
//
// MessageText:
//
// The specifiec context is already attached to another object
//
  {$EXTERNALSYM STATUS_FLT_CONTEXT_ALREADY_LINKED}
  STATUS_FLT_CONTEXT_ALREADY_LINKED =  TNTStatus($C01C001C);

//
// MessageId: STATUS_FLT_NO_WAITER_FOR_REPLY
//
// MessageText:
//
// No waiter is present for the filter's reply to this message.
//
  {$EXTERNALSYM STATUS_FLT_NO_WAITER_FOR_REPLY}
  STATUS_FLT_NO_WAITER_FOR_REPLY   =  TNTStatus($C01C0020);


//
//  Side-by-side (SXS) error values
//

//
// MessageId: STATUS_SXS_SECTION_NOT_FOUND
//
// MessageText:
//
// The requested section is not present in the activation context.
//
  {$EXTERNALSYM STATUS_SXS_SECTION_NOT_FOUND}
  STATUS_SXS_SECTION_NOT_FOUND     =  TNTStatus($C0150001);

//
// MessageId: STATUS_SXS_CANT_GEN_ACTCTX
//
// MessageText:
//
// Windows was not able to process the application binding information.
// Please refer to your System Event Log for further information.
//
  {$EXTERNALSYM STATUS_SXS_CANT_GEN_ACTCTX}
  STATUS_SXS_CANT_GEN_ACTCTX       =  TNTStatus($C0150002);

//
// MessageId: STATUS_SXS_INVALID_ACTCTXDATA_FORMAT
//
// MessageText:
//
// The application binding data format is invalid.
//
  {$EXTERNALSYM STATUS_SXS_INVALID_ACTCTXDATA_FORMAT}
  STATUS_SXS_INVALID_ACTCTXDATA_FORMAT =  TNTStatus($C0150003);

//
// MessageId: STATUS_SXS_ASSEMBLY_NOT_FOUND
//
// MessageText:
//
// The referenced assembly is not installed on your system.
//
  {$EXTERNALSYM STATUS_SXS_ASSEMBLY_NOT_FOUND}
  STATUS_SXS_ASSEMBLY_NOT_FOUND    =  TNTStatus($C0150004);

//
// MessageId: STATUS_SXS_MANIFEST_FORMAT_ERROR
//
// MessageText:
//
// The manifest file does not begin with the required tag and format information.
//
  {$EXTERNALSYM STATUS_SXS_MANIFEST_FORMAT_ERROR}
  STATUS_SXS_MANIFEST_FORMAT_ERROR =  TNTStatus($C0150005);

//
// MessageId: STATUS_SXS_MANIFEST_PARSE_ERROR
//
// MessageText:
//
// The manifest file contains one or more syntax errors.
//
  {$EXTERNALSYM STATUS_SXS_MANIFEST_PARSE_ERROR}
  STATUS_SXS_MANIFEST_PARSE_ERROR  =  TNTStatus($C0150006);

//
// MessageId: STATUS_SXS_ACTIVATION_CONTEXT_DISABLED
//
// MessageText:
//
// The application attempted to activate a disabled activation context.
//
  {$EXTERNALSYM STATUS_SXS_ACTIVATION_CONTEXT_DISABLED}
  STATUS_SXS_ACTIVATION_CONTEXT_DISABLED =  TNTStatus($C0150007);

//
// MessageId: STATUS_SXS_KEY_NOT_FOUND
//
// MessageText:
//
// The requested lookup key was not found in any active activation context.
//
  {$EXTERNALSYM STATUS_SXS_KEY_NOT_FOUND}
  STATUS_SXS_KEY_NOT_FOUND         =  TNTStatus($C0150008);

//
// MessageId: STATUS_SXS_VERSION_CONFLICT
//
// MessageText:
//
// A component version required by the application conflicts with another component version already active.
//
  {$EXTERNALSYM STATUS_SXS_VERSION_CONFLICT}
  STATUS_SXS_VERSION_CONFLICT      =  TNTStatus($C0150009);

//
// MessageId: STATUS_SXS_WRONG_SECTION_TYPE
//
// MessageText:
//
// The type requested activation context section does not match the query API used.
//
  {$EXTERNALSYM STATUS_SXS_WRONG_SECTION_TYPE}
  STATUS_SXS_WRONG_SECTION_TYPE    =  TNTStatus($C015000A);

//
// MessageId: STATUS_SXS_THREAD_QUERIES_DISABLED
//
// MessageText:
//
// Lack of system resources has required isolated activation to be disabled for the current thread of execution.
//
  {$EXTERNALSYM STATUS_SXS_THREAD_QUERIES_DISABLED}
  STATUS_SXS_THREAD_QUERIES_DISABLED =  TNTStatus($C015000B);

//
// MessageId: STATUS_SXS_ASSEMBLY_MISSING
//
// MessageText:
//
// The referenced assembly could not be found.
//
  {$EXTERNALSYM STATUS_SXS_ASSEMBLY_MISSING}
  STATUS_SXS_ASSEMBLY_MISSING      =  TNTStatus($C015000C);

//
// MessageId: STATUS_SXS_RELEASE_ACTIVATION_CONTEXT
//
// MessageText:
//
// A kernel mode component is releasing a reference on an activation context.
//
  {$EXTERNALSYM STATUS_SXS_RELEASE_ACTIVATION_CONTEXT}
  STATUS_SXS_RELEASE_ACTIVATION_CONTEXT =  TNTStatus($4015000D);

//
// MessageId: STATUS_SXS_PROCESS_DEFAULT_ALREADY_SET
//
// MessageText:
//
// An attempt to set the process default activation context failed because the process default activation context was already set.
//
  {$EXTERNALSYM STATUS_SXS_PROCESS_DEFAULT_ALREADY_SET}
  STATUS_SXS_PROCESS_DEFAULT_ALREADY_SET =  TNTStatus($C015000E);

//
// MessageId: STATUS_SXS_EARLY_DEACTIVATION
//
// MessageText:
//
// The activation context being deactivated is not the most recently activated one.
//
  {$EXTERNALSYM STATUS_SXS_EARLY_DEACTIVATION}
  STATUS_SXS_EARLY_DEACTIVATION    =  TNTStatus($C015000F);    // winnt

//
// MessageId: STATUS_SXS_INVALID_DEACTIVATION
//
// MessageText:
//
// The activation context being deactivated is not active for the current thread of execution.
//
  {$EXTERNALSYM STATUS_SXS_INVALID_DEACTIVATION}
  STATUS_SXS_INVALID_DEACTIVATION  =  TNTStatus($C0150010);    // winnt

//
// MessageId: STATUS_SXS_MULTIPLE_DEACTIVATION
//
// MessageText:
//
// The activation context being deactivated has already been deactivated.
//
  {$EXTERNALSYM STATUS_SXS_MULTIPLE_DEACTIVATION}
  STATUS_SXS_MULTIPLE_DEACTIVATION =  TNTStatus($C0150011);

//
// MessageId: STATUS_SXS_SYSTEM_DEFAULT_ACTIVATION_CONTEXT_EMPTY
//
// MessageText:
//
// The activation context of system default assembly could not be generated.
//
  {$EXTERNALSYM STATUS_SXS_SYSTEM_DEFAULT_ACTIVATION_CONTEXT_EMPTY}
  STATUS_SXS_SYSTEM_DEFAULT_ACTIVATION_CONTEXT_EMPTY =  TNTStatus($C0150012);

//
// MessageId: STATUS_SXS_PROCESS_TERMINATION_REQUESTED
//
// MessageText:
//
// A component used by the isolation facility has requested to terminate the process.
//
  {$EXTERNALSYM STATUS_SXS_PROCESS_TERMINATION_REQUESTED}
  STATUS_SXS_PROCESS_TERMINATION_REQUESTED =  TNTStatus($C0150013);

//
// MessageId: STATUS_SXS_CORRUPT_ACTIVATION_STACK
//
// MessageText:
//
// The activation context activation stack for the running thread of execution is corrupt.
//
  {$EXTERNALSYM STATUS_SXS_CORRUPT_ACTIVATION_STACK}
  STATUS_SXS_CORRUPT_ACTIVATION_STACK =  TNTStatus($C0150014);

//
// MessageId: STATUS_SXS_CORRUPTION
//
// MessageText:
//
// The application isolation metadata for this process or thread has become corrupt.
//
  {$EXTERNALSYM STATUS_SXS_CORRUPTION}
  STATUS_SXS_CORRUPTION            =  TNTStatus($C0150015);

//
// MessageId: STATUS_SXS_INVALID_IDENTITY_ATTRIBUTE_VALUE
//
// MessageText:
//
// The value of an attribute in an identity is not within the legal range.
//
  {$EXTERNALSYM STATUS_SXS_INVALID_IDENTITY_ATTRIBUTE_VALUE}
  STATUS_SXS_INVALID_IDENTITY_ATTRIBUTE_VALUE =  TNTStatus($C0150016);

//
// MessageId: STATUS_SXS_INVALID_IDENTITY_ATTRIBUTE_NAME
//
// MessageText:
//
// The name of an attribute in an identity is not within the legal range.
//
  {$EXTERNALSYM STATUS_SXS_INVALID_IDENTITY_ATTRIBUTE_NAME}
  STATUS_SXS_INVALID_IDENTITY_ATTRIBUTE_NAME =  TNTStatus($C0150017);

//
// MessageId: STATUS_SXS_IDENTITY_DUPLICATE_ATTRIBUTE
//
// MessageText:
//
// An identity contains two definitions for the same attribute.
//
  {$EXTERNALSYM STATUS_SXS_IDENTITY_DUPLICATE_ATTRIBUTE}
  STATUS_SXS_IDENTITY_DUPLICATE_ATTRIBUTE =  TNTStatus($C0150018);

//
// MessageId: STATUS_SXS_IDENTITY_PARSE_ERROR
//
// MessageText:
//
// The identity string is malformed.  This may be due to a trailing comma, more than two unnamed attributes, missing attribute name or missing attribute value.
//
  {$EXTERNALSYM STATUS_SXS_IDENTITY_PARSE_ERROR}
  STATUS_SXS_IDENTITY_PARSE_ERROR  =  TNTStatus($C0150019);

//
// MessageId: STATUS_SXS_COMPONENT_STORE_CORRUPT
//
// MessageText:
//
// The component store has been corrupted.
//
  {$EXTERNALSYM STATUS_SXS_COMPONENT_STORE_CORRUPT}
  STATUS_SXS_COMPONENT_STORE_CORRUPT =  TNTStatus($C015001A);

//
// MessageId: STATUS_SXS_FILE_HASH_MISMATCH
//
// MessageText:
//
// A component's file does not match the verification information present in the component manifest.
//
  {$EXTERNALSYM STATUS_SXS_FILE_HASH_MISMATCH}
  STATUS_SXS_FILE_HASH_MISMATCH    =  TNTStatus($C015001B);

//
// MessageId: STATUS_SXS_MANIFEST_IDENTITY_SAME_BUT_CONTENTS_DIFFERENT
//
// MessageText:
//
// The identities of the manifests are identical but their contents are different.
//
  {$EXTERNALSYM STATUS_SXS_MANIFEST_IDENTITY_SAME_BUT_CONTENTS_DIFFERENT}
  STATUS_SXS_MANIFEST_IDENTITY_SAME_BUT_CONTENTS_DIFFERENT =  TNTStatus($C015001C);

//
// MessageId: STATUS_SXS_IDENTITIES_DIFFERENT
//
// MessageText:
//
// The component identities are different.
//
  {$EXTERNALSYM STATUS_SXS_IDENTITIES_DIFFERENT}
  STATUS_SXS_IDENTITIES_DIFFERENT  =  TNTStatus($C015001D);

//
// MessageId: STATUS_SXS_ASSEMBLY_IS_NOT_A_DEPLOYMENT
//
// MessageText:
//
// The assembly is not a deployment.
//
  {$EXTERNALSYM STATUS_SXS_ASSEMBLY_IS_NOT_A_DEPLOYMENT}
  STATUS_SXS_ASSEMBLY_IS_NOT_A_DEPLOYMENT =  TNTStatus($C015001E);

//
// MessageId: STATUS_SXS_FILE_NOT_PART_OF_ASSEMBLY
//
// MessageText:
//
// The file is not a part of the assembly.
//
  {$EXTERNALSYM STATUS_SXS_FILE_NOT_PART_OF_ASSEMBLY}
  STATUS_SXS_FILE_NOT_PART_OF_ASSEMBLY =  TNTStatus($C015001F);

//
// MessageId: STATUS_ADVANCED_INSTALLER_FAILED
//
// MessageText:
//
// An advanced installer failed during setup or servicing.
//
  {$EXTERNALSYM STATUS_ADVANCED_INSTALLER_FAILED}
  STATUS_ADVANCED_INSTALLER_FAILED =  TNTStatus($C0150020);

//
// MessageId: STATUS_XML_ENCODING_MISMATCH
//
// MessageText:
//
// The character encoding in the XML declaration did not match the encoding used in the document.
//
  {$EXTERNALSYM STATUS_XML_ENCODING_MISMATCH}
  STATUS_XML_ENCODING_MISMATCH     =  TNTStatus($C0150021);

//
// MessageId: STATUS_SXS_MANIFEST_TOO_BIG
//
// MessageText:
//
// The size of the manifest exceeds the maximum allowed.
//
  {$EXTERNALSYM STATUS_SXS_MANIFEST_TOO_BIG}
  STATUS_SXS_MANIFEST_TOO_BIG      =  TNTStatus($C0150022);

//
// MessageId: STATUS_SXS_SETTING_NOT_REGISTERED
//
// MessageText:
//
// The setting is not registered.
//
  {$EXTERNALSYM STATUS_SXS_SETTING_NOT_REGISTERED}
  STATUS_SXS_SETTING_NOT_REGISTERED =  TNTStatus($C0150023);

//
// MessageId: STATUS_SXS_TRANSACTION_CLOSURE_INCOMPLETE
//
// MessageText:
//
// One or more required members of the transaction are not present.
//
  {$EXTERNALSYM STATUS_SXS_TRANSACTION_CLOSURE_INCOMPLETE}
  STATUS_SXS_TRANSACTION_CLOSURE_INCOMPLETE =  TNTStatus($C0150024);

//
// MessageId: STATUS_SMI_PRIMITIVE_INSTALLER_FAILED
//
// MessageText:
//
// The SMI primitive installer failed during setup or servicing.
//
  {$EXTERNALSYM STATUS_SMI_PRIMITIVE_INSTALLER_FAILED}
  STATUS_SMI_PRIMITIVE_INSTALLER_FAILED =  TNTStatus($C0150025);

//
// MessageId: STATUS_GENERIC_COMMAND_FAILED
//
// MessageText:
//
// A generic command executable returned a result that indicates failure.
//
  {$EXTERNALSYM STATUS_GENERIC_COMMAND_FAILED}
  STATUS_GENERIC_COMMAND_FAILED    =  TNTStatus($C0150026);

//
// MessageId: STATUS_SXS_FILE_HASH_MISSING
//
// MessageText:
//
// A component is missing file verification information in its manifest.
//
  {$EXTERNALSYM STATUS_SXS_FILE_HASH_MISSING}
  STATUS_SXS_FILE_HASH_MISSING     =  TNTStatus($C0150027);


//
//  Cluster error values
//

//
// MessageId: STATUS_CLUSTER_INVALID_NODE
//
// MessageText:
//
// The cluster node is not valid.
//
  {$EXTERNALSYM STATUS_CLUSTER_INVALID_NODE}
  STATUS_CLUSTER_INVALID_NODE      =  TNTStatus($C0130001);

//
// MessageId: STATUS_CLUSTER_NODE_EXISTS
//
// MessageText:
//
// The cluster node already exists.
//
  {$EXTERNALSYM STATUS_CLUSTER_NODE_EXISTS}
  STATUS_CLUSTER_NODE_EXISTS       =  TNTStatus($C0130002);

//
// MessageId: STATUS_CLUSTER_JOIN_IN_PROGRESS
//
// MessageText:
//
// A node is in the process of joining the cluster.
//
  {$EXTERNALSYM STATUS_CLUSTER_JOIN_IN_PROGRESS}
  STATUS_CLUSTER_JOIN_IN_PROGRESS  =  TNTStatus($C0130003);

//
// MessageId: STATUS_CLUSTER_NODE_NOT_FOUND
//
// MessageText:
//
// The cluster node was not found.
//
  {$EXTERNALSYM STATUS_CLUSTER_NODE_NOT_FOUND}
  STATUS_CLUSTER_NODE_NOT_FOUND    =  TNTStatus($C0130004);

//
// MessageId: STATUS_CLUSTER_LOCAL_NODE_NOT_FOUND
//
// MessageText:
//
// The cluster local node information was not found.
//
  {$EXTERNALSYM STATUS_CLUSTER_LOCAL_NODE_NOT_FOUND}
  STATUS_CLUSTER_LOCAL_NODE_NOT_FOUND =  TNTStatus($C0130005);

//
// MessageId: STATUS_CLUSTER_NETWORK_EXISTS
//
// MessageText:
//
// The cluster network already exists.
//
  {$EXTERNALSYM STATUS_CLUSTER_NETWORK_EXISTS}
  STATUS_CLUSTER_NETWORK_EXISTS    =  TNTStatus($C0130006);

//
// MessageId: STATUS_CLUSTER_NETWORK_NOT_FOUND
//
// MessageText:
//
// The cluster network was not found.
//
  {$EXTERNALSYM STATUS_CLUSTER_NETWORK_NOT_FOUND}
  STATUS_CLUSTER_NETWORK_NOT_FOUND =  TNTStatus($C0130007);

//
// MessageId: STATUS_CLUSTER_NETINTERFACE_EXISTS
//
// MessageText:
//
// The cluster network interface already exists.
//
  {$EXTERNALSYM STATUS_CLUSTER_NETINTERFACE_EXISTS}
  STATUS_CLUSTER_NETINTERFACE_EXISTS =  TNTStatus($C0130008);

//
// MessageId: STATUS_CLUSTER_NETINTERFACE_NOT_FOUND
//
// MessageText:
//
// The cluster network interface was not found.
//
  {$EXTERNALSYM STATUS_CLUSTER_NETINTERFACE_NOT_FOUND}
  STATUS_CLUSTER_NETINTERFACE_NOT_FOUND =  TNTStatus($C0130009);

//
// MessageId: STATUS_CLUSTER_INVALID_REQUEST
//
// MessageText:
//
// The cluster request is not valid for this object.
//
  {$EXTERNALSYM STATUS_CLUSTER_INVALID_REQUEST}
  STATUS_CLUSTER_INVALID_REQUEST   =  TNTStatus($C013000A);

//
// MessageId: STATUS_CLUSTER_INVALID_NETWORK_PROVIDER
//
// MessageText:
//
// The cluster network provider is not valid.
//
  {$EXTERNALSYM STATUS_CLUSTER_INVALID_NETWORK_PROVIDER}
  STATUS_CLUSTER_INVALID_NETWORK_PROVIDER =  TNTStatus($C013000B);

//
// MessageId: STATUS_CLUSTER_NODE_DOWN
//
// MessageText:
//
// The cluster node is down.
//
  {$EXTERNALSYM STATUS_CLUSTER_NODE_DOWN}
  STATUS_CLUSTER_NODE_DOWN         =  TNTStatus($C013000C);

//
// MessageId: STATUS_CLUSTER_NODE_UNREACHABLE
//
// MessageText:
//
// The cluster node is not reachable.
//
  {$EXTERNALSYM STATUS_CLUSTER_NODE_UNREACHABLE}
  STATUS_CLUSTER_NODE_UNREACHABLE  =  TNTStatus($C013000D);

//
// MessageId: STATUS_CLUSTER_NODE_NOT_MEMBER
//
// MessageText:
//
// The cluster node is not a member of the cluster.
//
  {$EXTERNALSYM STATUS_CLUSTER_NODE_NOT_MEMBER}
  STATUS_CLUSTER_NODE_NOT_MEMBER   =  TNTStatus($C013000E);

//
// MessageId: STATUS_CLUSTER_JOIN_NOT_IN_PROGRESS
//
// MessageText:
//
// A cluster join operation is not in progress.
//
  {$EXTERNALSYM STATUS_CLUSTER_JOIN_NOT_IN_PROGRESS}
  STATUS_CLUSTER_JOIN_NOT_IN_PROGRESS =  TNTStatus($C013000F);

//
// MessageId: STATUS_CLUSTER_INVALID_NETWORK
//
// MessageText:
//
// The cluster network is not valid.
//
  {$EXTERNALSYM STATUS_CLUSTER_INVALID_NETWORK}
  STATUS_CLUSTER_INVALID_NETWORK   =  TNTStatus($C0130010);

//
// MessageId: STATUS_CLUSTER_NO_NET_ADAPTERS
//
// MessageText:
//
// No network adapters are available.
//
  {$EXTERNALSYM STATUS_CLUSTER_NO_NET_ADAPTERS}
  STATUS_CLUSTER_NO_NET_ADAPTERS   =  TNTStatus($C0130011);

//
// MessageId: STATUS_CLUSTER_NODE_UP
//
// MessageText:
//
// The cluster node is up.
//
  {$EXTERNALSYM STATUS_CLUSTER_NODE_UP}
  STATUS_CLUSTER_NODE_UP           =  TNTStatus($C0130012);

//
// MessageId: STATUS_CLUSTER_NODE_PAUSED
//
// MessageText:
//
// The cluster node is paused.
//
  {$EXTERNALSYM STATUS_CLUSTER_NODE_PAUSED}
  STATUS_CLUSTER_NODE_PAUSED       =  TNTStatus($C0130013);

//
// MessageId: STATUS_CLUSTER_NODE_NOT_PAUSED
//
// MessageText:
//
// The cluster node is not paused.
//
  {$EXTERNALSYM STATUS_CLUSTER_NODE_NOT_PAUSED}
  STATUS_CLUSTER_NODE_NOT_PAUSED   =  TNTStatus($C0130014);

//
// MessageId: STATUS_CLUSTER_NO_SECURITY_CONTEXT
//
// MessageText:
//
// No cluster security context is available.
//
  {$EXTERNALSYM STATUS_CLUSTER_NO_SECURITY_CONTEXT}
  STATUS_CLUSTER_NO_SECURITY_CONTEXT =  TNTStatus($C0130015);

//
// MessageId: STATUS_CLUSTER_NETWORK_NOT_INTERNAL
//
// MessageText:
//
// The cluster network is not configured for internal cluster communication.
//
  {$EXTERNALSYM STATUS_CLUSTER_NETWORK_NOT_INTERNAL}
  STATUS_CLUSTER_NETWORK_NOT_INTERNAL =  TNTStatus($C0130016);

//
// MessageId: STATUS_CLUSTER_POISONED
//
// MessageText:
//
// The cluster node has been poisoned.
//
  {$EXTERNALSYM STATUS_CLUSTER_POISONED}
  STATUS_CLUSTER_POISONED          =  TNTStatus($C0130017);


//
//  Transaction Manager error values
//

//
// MessageId: STATUS_TRANSACTIONAL_CONFLICT
//
// MessageText:
//
// The function attempted to use a name that is reserved for use by another transaction.
//
  {$EXTERNALSYM STATUS_TRANSACTIONAL_CONFLICT}
  STATUS_TRANSACTIONAL_CONFLICT    =  TNTStatus($C0190001);

//
// MessageId: STATUS_INVALID_TRANSACTION
//
// MessageText:
//
// The transaction handle associated with this operation is not valid.
//
  {$EXTERNALSYM STATUS_INVALID_TRANSACTION}
  STATUS_INVALID_TRANSACTION       =  TNTStatus($C0190002);

//
// MessageId: STATUS_TRANSACTION_NOT_ACTIVE
//
// MessageText:
//
// The requested operation was made in the context of a transaction that is no longer active.
//
  {$EXTERNALSYM STATUS_TRANSACTION_NOT_ACTIVE}
  STATUS_TRANSACTION_NOT_ACTIVE    =  TNTStatus($C0190003);

//
// MessageId: STATUS_TM_INITIALIZATION_FAILED
//
// MessageText:
//
// The Transaction Manager was unable to be successfully initialized.  Transacted operations are not supported.
//
  {$EXTERNALSYM STATUS_TM_INITIALIZATION_FAILED}
  STATUS_TM_INITIALIZATION_FAILED  =  TNTStatus($C0190004);

//
// MessageId: STATUS_RM_NOT_ACTIVE
//
// MessageText:
//
// Transaction support within the specified file system resource manager is not started or was shutdown due to an error.
//
  {$EXTERNALSYM STATUS_RM_NOT_ACTIVE}
  STATUS_RM_NOT_ACTIVE             =  TNTStatus($C0190005);

//
// MessageId: STATUS_RM_METADATA_CORRUPT
//
// MessageText:
//
// The metadata of the RM has been corrupted.  The RM will not function.
//
  {$EXTERNALSYM STATUS_RM_METADATA_CORRUPT}
  STATUS_RM_METADATA_CORRUPT       =  TNTStatus($C0190006);

//
// MessageId: STATUS_TRANSACTION_NOT_JOINED
//
// MessageText:
//
// The resource manager has attempted to prepare a transaction that it has not successfully joined.
//
  {$EXTERNALSYM STATUS_TRANSACTION_NOT_JOINED}
  STATUS_TRANSACTION_NOT_JOINED    =  TNTStatus($C0190007);

//
// MessageId: STATUS_DIRECTORY_NOT_RM
//
// MessageText:
//
// The specified directory does not contain a file system resource manager.
//
  {$EXTERNALSYM STATUS_DIRECTORY_NOT_RM}
  STATUS_DIRECTORY_NOT_RM          =  TNTStatus($C0190008);

//
// MessageId: STATUS_COULD_NOT_RESIZE_LOG
//
// MessageText:
//
// The log could not be set to the requested size.
//
  {$EXTERNALSYM STATUS_COULD_NOT_RESIZE_LOG}
  STATUS_COULD_NOT_RESIZE_LOG      =  TNTStatus($80190009);

//
// MessageId: STATUS_TRANSACTIONS_UNSUPPORTED_REMOTE
//
// MessageText:
//
// The remote server or share does not support transacted file operations.
//
  {$EXTERNALSYM STATUS_TRANSACTIONS_UNSUPPORTED_REMOTE}
  STATUS_TRANSACTIONS_UNSUPPORTED_REMOTE =  TNTStatus($C019000A);

//
// MessageId: STATUS_LOG_RESIZE_INVALID_SIZE
//
// MessageText:
//
// The requested log size for the file system resource manager is invalid.
//
  {$EXTERNALSYM STATUS_LOG_RESIZE_INVALID_SIZE}
  STATUS_LOG_RESIZE_INVALID_SIZE   =  TNTStatus($C019000B);

//
// MessageId: STATUS_REMOTE_FILE_VERSION_MISMATCH
//
// MessageText:
//
// The remote server sent mismatching version number or Fid for a file opened with transactions.
//
  {$EXTERNALSYM STATUS_REMOTE_FILE_VERSION_MISMATCH}
  STATUS_REMOTE_FILE_VERSION_MISMATCH =  TNTStatus($C019000C);

//
// MessageId: STATUS_CRM_PROTOCOL_ALREADY_EXISTS
//
// MessageText:
//
// The RM tried to register a protocol that already exists.
//
  {$EXTERNALSYM STATUS_CRM_PROTOCOL_ALREADY_EXISTS}
  STATUS_CRM_PROTOCOL_ALREADY_EXISTS =  TNTStatus($C019000F);

//
// MessageId: STATUS_TRANSACTION_PROPAGATION_FAILED
//
// MessageText:
//
// The attempt to propagate the Transaction failed.
//
  {$EXTERNALSYM STATUS_TRANSACTION_PROPAGATION_FAILED}
  STATUS_TRANSACTION_PROPAGATION_FAILED =  TNTStatus($C0190010);

//
// MessageId: STATUS_CRM_PROTOCOL_NOT_FOUND
//
// MessageText:
//
// The requested propagation protocol was not registered as a CRM.
//
  {$EXTERNALSYM STATUS_CRM_PROTOCOL_NOT_FOUND}
  STATUS_CRM_PROTOCOL_NOT_FOUND    =  TNTStatus($C0190011);

//
// MessageId: STATUS_TRANSACTION_SUPERIOR_EXISTS
//
// MessageText:
//
// The Transaction object already has a superior enlistment, and the caller attempted an operation that would have created a new superior.  Only a single superior enlistment is allowed.
//
  {$EXTERNALSYM STATUS_TRANSACTION_SUPERIOR_EXISTS}
  STATUS_TRANSACTION_SUPERIOR_EXISTS =  TNTStatus($C0190012);

//
// MessageId: STATUS_TRANSACTION_REQUEST_NOT_VALID
//
// MessageText:
//
// The requested operation is not valid on the Transaction object in its current state.
//
  {$EXTERNALSYM STATUS_TRANSACTION_REQUEST_NOT_VALID}
  STATUS_TRANSACTION_REQUEST_NOT_VALID =  TNTStatus($C0190013);

//
// MessageId: STATUS_TRANSACTION_NOT_REQUESTED
//
// MessageText:
//
// The caller has called a response API, but the response is not expected because the TM did not issue the corresponding request to the caller.
//
  {$EXTERNALSYM STATUS_TRANSACTION_NOT_REQUESTED}
  STATUS_TRANSACTION_NOT_REQUESTED =  TNTStatus($C0190014);

//
// MessageId: STATUS_TRANSACTION_ALREADY_ABORTED
//
// MessageText:
//
// It is too late to perform the requested operation, since the Transaction has already been aborted.
//
  {$EXTERNALSYM STATUS_TRANSACTION_ALREADY_ABORTED}
  STATUS_TRANSACTION_ALREADY_ABORTED =  TNTStatus($C0190015);

//
// MessageId: STATUS_TRANSACTION_ALREADY_COMMITTED
//
// MessageText:
//
// It is too late to perform the requested operation, since the Transaction has already been committed.
//
  {$EXTERNALSYM STATUS_TRANSACTION_ALREADY_COMMITTED}
  STATUS_TRANSACTION_ALREADY_COMMITTED =  TNTStatus($C0190016);

//
// MessageId: STATUS_TRANSACTION_INVALID_MARSHALL_BUFFER
//
// MessageText:
//
// The buffer passed in to NtPushTransaction or NtPullTransaction is not in a valid format.
//
  {$EXTERNALSYM STATUS_TRANSACTION_INVALID_MARSHALL_BUFFER}
  STATUS_TRANSACTION_INVALID_MARSHALL_BUFFER =  TNTStatus($C0190017);

//
// MessageId: STATUS_CURRENT_TRANSACTION_NOT_VALID
//
// MessageText:
//
// The current transaction context associated with the thread is not a valid handle to a transaction object.
//
  {$EXTERNALSYM STATUS_CURRENT_TRANSACTION_NOT_VALID}
  STATUS_CURRENT_TRANSACTION_NOT_VALID =  TNTStatus($C0190018);

//
// MessageId: STATUS_LOG_GROWTH_FAILED
//
// MessageText:
//
// An attempt to create space in the transactional resource manager's log failed.  The failure status has been recorded in the event log.
//
  {$EXTERNALSYM STATUS_LOG_GROWTH_FAILED}
  STATUS_LOG_GROWTH_FAILED         =  TNTStatus($C0190019);

//
// MessageId: STATUS_OBJECT_NO_LONGER_EXISTS
//
// MessageText:
//
// The object (file, stream, link) corresponding to the handle has been deleted by a transaction savepoint rollback.
//
  {$EXTERNALSYM STATUS_OBJECT_NO_LONGER_EXISTS}
  STATUS_OBJECT_NO_LONGER_EXISTS   =  TNTStatus($C0190021);

//
// MessageId: STATUS_STREAM_MINIVERSION_NOT_FOUND
//
// MessageText:
//
// The specified file miniversion was not found for this transacted file open.
//
  {$EXTERNALSYM STATUS_STREAM_MINIVERSION_NOT_FOUND}
  STATUS_STREAM_MINIVERSION_NOT_FOUND =  TNTStatus($C0190022);

//
// MessageId: STATUS_STREAM_MINIVERSION_NOT_VALID
//
// MessageText:
//
// The specified file miniversion was found but has been invalidated. Most likely cause is a transaction savepoint rollback.
//
  {$EXTERNALSYM STATUS_STREAM_MINIVERSION_NOT_VALID}
  STATUS_STREAM_MINIVERSION_NOT_VALID =  TNTStatus($C0190023);

//
// MessageId: STATUS_MINIVERSION_INACCESSIBLE_FROM_SPECIFIED_TRANSACTION
//
// MessageText:
//
// A miniversion may only be opened in the context of the transaction that created it.
//
  {$EXTERNALSYM STATUS_MINIVERSION_INACCESSIBLE_FROM_SPECIFIED_TRANSACTION}
  STATUS_MINIVERSION_INACCESSIBLE_FROM_SPECIFIED_TRANSACTION =  TNTStatus($C0190024);

//
// MessageId: STATUS_CANT_OPEN_MINIVERSION_WITH_MODIFY_INTENT
//
// MessageText:
//
// It is not possible to open a miniversion with modify access.
//
  {$EXTERNALSYM STATUS_CANT_OPEN_MINIVERSION_WITH_MODIFY_INTENT}
  STATUS_CANT_OPEN_MINIVERSION_WITH_MODIFY_INTENT =  TNTStatus($C0190025);

//
// MessageId: STATUS_CANT_CREATE_MORE_STREAM_MINIVERSIONS
//
// MessageText:
//
// It is not possible to create any more miniversions for this stream.
//
  {$EXTERNALSYM STATUS_CANT_CREATE_MORE_STREAM_MINIVERSIONS}
  STATUS_CANT_CREATE_MORE_STREAM_MINIVERSIONS =  TNTStatus($C0190026);

//
// MessageId: STATUS_HANDLE_NO_LONGER_VALID
//
// MessageText:
//
// The handle has been invalidated by a transaction. The most likely cause is the presence of memory mapping on a file or an open handle when the transaction ended or rolled back to savepoint.
//
  {$EXTERNALSYM STATUS_HANDLE_NO_LONGER_VALID}
  STATUS_HANDLE_NO_LONGER_VALID    =  TNTStatus($C0190028);

//
// MessageId: STATUS_NO_TXF_METADATA
//
// MessageText:
//
// There is no transaction metadata on the file.
//
  {$EXTERNALSYM STATUS_NO_TXF_METADATA}
  STATUS_NO_TXF_METADATA           =  TNTStatus($80190029);

//
// MessageId: STATUS_LOG_CORRUPTION_DETECTED
//
// MessageText:
//
// The log data is corrupt.
//
  {$EXTERNALSYM STATUS_LOG_CORRUPTION_DETECTED}
  STATUS_LOG_CORRUPTION_DETECTED   =  TNTStatus($C0190030);

//
// MessageId: STATUS_CANT_RECOVER_WITH_HANDLE_OPEN
//
// MessageText:
//
// The file can't be recovered because there is a handle still open on it.
//
  {$EXTERNALSYM STATUS_CANT_RECOVER_WITH_HANDLE_OPEN}
  STATUS_CANT_RECOVER_WITH_HANDLE_OPEN =  TNTStatus($80190031);

//
// MessageId: STATUS_RM_DISCONNECTED
//
// MessageText:
//
// The transaction outcome is unavailable because the resource manager responsible for it has disconnected.
//
  {$EXTERNALSYM STATUS_RM_DISCONNECTED}
  STATUS_RM_DISCONNECTED           =  TNTStatus($C0190032);

//
// MessageId: STATUS_ENLISTMENT_NOT_SUPERIOR
//
// MessageText:
//
// The request was rejected because the enlistment in question is not a superior enlistment.
//
  {$EXTERNALSYM STATUS_ENLISTMENT_NOT_SUPERIOR}
  STATUS_ENLISTMENT_NOT_SUPERIOR   =  TNTStatus($C0190033);

//
// MessageId: STATUS_RECOVERY_NOT_NEEDED
//
// MessageText:
//
// The transactional resource manager is already consistent.  Recovery is not needed.
//
  {$EXTERNALSYM STATUS_RECOVERY_NOT_NEEDED}
  STATUS_RECOVERY_NOT_NEEDED       =  TNTStatus($40190034);

//
// MessageId: STATUS_RM_ALREADY_STARTED
//
// MessageText:
//
// The transactional resource manager has already been started.
//
  {$EXTERNALSYM STATUS_RM_ALREADY_STARTED}
  STATUS_RM_ALREADY_STARTED        =  TNTStatus($40190035);

//
// MessageId: STATUS_FILE_IDENTITY_NOT_PERSISTENT
//
// MessageText:
//
// The file cannot be opened transactionally, because its identity depends on the outcome of an unresolved transaction.
//
  {$EXTERNALSYM STATUS_FILE_IDENTITY_NOT_PERSISTENT}
  STATUS_FILE_IDENTITY_NOT_PERSISTENT =  TNTStatus($C0190036);

//
// MessageId: STATUS_CANT_BREAK_TRANSACTIONAL_DEPENDENCY
//
// MessageText:
//
// The operation cannot be performed because another transaction is depending on the fact that this property will not change.
//
  {$EXTERNALSYM STATUS_CANT_BREAK_TRANSACTIONAL_DEPENDENCY}
  STATUS_CANT_BREAK_TRANSACTIONAL_DEPENDENCY =  TNTStatus($C0190037);

//
// MessageId: STATUS_CANT_CROSS_RM_BOUNDARY
//
// MessageText:
//
// The operation would involve a single file with two transactional resource managers and is therefore not allowed.
//
  {$EXTERNALSYM STATUS_CANT_CROSS_RM_BOUNDARY}
  STATUS_CANT_CROSS_RM_BOUNDARY    =  TNTStatus($C0190038);

//
// MessageId: STATUS_TXF_DIR_NOT_EMPTY
//
// MessageText:
//
// The $Txf directory must be empty for this operation to succeed.
//
  {$EXTERNALSYM STATUS_TXF_DIR_NOT_EMPTY}
  STATUS_TXF_DIR_NOT_EMPTY         =  TNTStatus($C0190039);

//
// MessageId: STATUS_INDOUBT_TRANSACTIONS_EXIST
//
// MessageText:
//
// The operation would leave a transactional resource manager in an inconsistent state and is therefore not allowed.
//
  {$EXTERNALSYM STATUS_INDOUBT_TRANSACTIONS_EXIST}
  STATUS_INDOUBT_TRANSACTIONS_EXIST =  TNTStatus($C019003A);

//
// MessageId: STATUS_TM_VOLATILE
//
// MessageText:
//
// The operation could not be completed because the transaction manager does not have a log.
//
  {$EXTERNALSYM STATUS_TM_VOLATILE}
  STATUS_TM_VOLATILE               =  TNTStatus($C019003B);

//
// MessageId: STATUS_ROLLBACK_TIMER_EXPIRED
//
// MessageText:
//
// A rollback could not be scheduled because a previously scheduled rollback has already executed or been queued for execution.
//
  {$EXTERNALSYM STATUS_ROLLBACK_TIMER_EXPIRED}
  STATUS_ROLLBACK_TIMER_EXPIRED    =  TNTStatus($C019003C);

//
// MessageId: STATUS_TXF_ATTRIBUTE_CORRUPT
//
// MessageText:
//
// The transactional metadata attribute on the file or directory %hs is corrupt and unreadable.
//
  {$EXTERNALSYM STATUS_TXF_ATTRIBUTE_CORRUPT}
  STATUS_TXF_ATTRIBUTE_CORRUPT     =  TNTStatus($C019003D);

//
// MessageId: STATUS_EFS_NOT_ALLOWED_IN_TRANSACTION
//
// MessageText:
//
// The encryption operation could not be completed because a transaction is active.
//
  {$EXTERNALSYM STATUS_EFS_NOT_ALLOWED_IN_TRANSACTION}
  STATUS_EFS_NOT_ALLOWED_IN_TRANSACTION =  TNTStatus($C019003E);

//
// MessageId: STATUS_TRANSACTIONAL_OPEN_NOT_ALLOWED
//
// MessageText:
//
// This object is not allowed to be opened in a transaction.
//
  {$EXTERNALSYM STATUS_TRANSACTIONAL_OPEN_NOT_ALLOWED}
  STATUS_TRANSACTIONAL_OPEN_NOT_ALLOWED =  TNTStatus($C019003F);

//
// MessageId: STATUS_TRANSACTED_MAPPING_UNSUPPORTED_REMOTE
//
// MessageText:
//
// Memory mapping (creating a mapped section) a remote file under a transaction is not supported.
//
  {$EXTERNALSYM STATUS_TRANSACTED_MAPPING_UNSUPPORTED_REMOTE}
  STATUS_TRANSACTED_MAPPING_UNSUPPORTED_REMOTE =  TNTStatus($C0190040);

//
// MessageId: STATUS_TXF_METADATA_ALREADY_PRESENT
//
// MessageText:
//
// Transaction metadata is already present on this file and cannot be superseded.
//
  {$EXTERNALSYM STATUS_TXF_METADATA_ALREADY_PRESENT}
  STATUS_TXF_METADATA_ALREADY_PRESENT =  TNTStatus($80190041);

//
// MessageId: STATUS_TRANSACTION_SCOPE_CALLBACKS_NOT_SET
//
// MessageText:
//
// A transaction scope could not be entered because the scope handler has not been initialized.
//
  {$EXTERNALSYM STATUS_TRANSACTION_SCOPE_CALLBACKS_NOT_SET}
  STATUS_TRANSACTION_SCOPE_CALLBACKS_NOT_SET =  TNTStatus($80190042);

//
// MessageId: STATUS_TRANSACTION_REQUIRED_PROMOTION
//
// MessageText:
//
// Promotion was required in order to allow the resource manager to enlist, but the transaction was set to disallow it.
//
  {$EXTERNALSYM STATUS_TRANSACTION_REQUIRED_PROMOTION}
  STATUS_TRANSACTION_REQUIRED_PROMOTION =  TNTStatus($C0190043);

//
// MessageId: STATUS_CANNOT_EXECUTE_FILE_IN_TRANSACTION
//
// MessageText:
//
// This file is open for modification in an unresolved transaction and may be opened for execute only by a transacted reader.
//
  {$EXTERNALSYM STATUS_CANNOT_EXECUTE_FILE_IN_TRANSACTION}
  STATUS_CANNOT_EXECUTE_FILE_IN_TRANSACTION =  TNTStatus($C0190044);

//
// MessageId: STATUS_TRANSACTIONS_NOT_FROZEN
//
// MessageText:
//
// The request to thaw frozen transactions was ignored because transactions had not previously been frozen.
//
  {$EXTERNALSYM STATUS_TRANSACTIONS_NOT_FROZEN}
  STATUS_TRANSACTIONS_NOT_FROZEN   =  TNTStatus($C0190045);

//
// MessageId: STATUS_TRANSACTION_FREEZE_IN_PROGRESS
//
// MessageText:
//
// Transactions cannot be frozen because a freeze is already in progress.
//
  {$EXTERNALSYM STATUS_TRANSACTION_FREEZE_IN_PROGRESS}
  STATUS_TRANSACTION_FREEZE_IN_PROGRESS =  TNTStatus($C0190046);

//
// MessageId: STATUS_NOT_SNAPSHOT_VOLUME
//
// MessageText:
//
// The target volume is not a snapshot volume.  This operation is only valid on a volume mounted as a snapshot.
//
  {$EXTERNALSYM STATUS_NOT_SNAPSHOT_VOLUME}
  STATUS_NOT_SNAPSHOT_VOLUME       =  TNTStatus($C0190047);

//
// MessageId: STATUS_NO_SAVEPOINT_WITH_OPEN_FILES
//
// MessageText:
//
// The savepoint operation failed because files are open on the transaction.  This is not permitted.
//
  {$EXTERNALSYM STATUS_NO_SAVEPOINT_WITH_OPEN_FILES}
  STATUS_NO_SAVEPOINT_WITH_OPEN_FILES =  TNTStatus($C0190048);

//
// MessageId: STATUS_SPARSE_NOT_ALLOWED_IN_TRANSACTION
//
// MessageText:
//
// The sparse operation could not be completed because a transaction is active on the file.
//
  {$EXTERNALSYM STATUS_SPARSE_NOT_ALLOWED_IN_TRANSACTION}
  STATUS_SPARSE_NOT_ALLOWED_IN_TRANSACTION =  TNTStatus($C0190049);

//
// MessageId: STATUS_TM_IDENTITY_MISMATCH
//
// MessageText:
//
// The call to create a TransactionManager object failed because the Tm Identity stored in the logfile does not match the Tm Identity that was passed in as an argument.
//
  {$EXTERNALSYM STATUS_TM_IDENTITY_MISMATCH}
  STATUS_TM_IDENTITY_MISMATCH      =  TNTStatus($C019004A);

//
// MessageId: STATUS_FLOATED_SECTION
//
// MessageText:
//
// I/O was attempted on a section object that has been floated as a result of a transaction ending.  There is no valid data.
//
  {$EXTERNALSYM STATUS_FLOATED_SECTION}
  STATUS_FLOATED_SECTION           =  TNTStatus($C019004B);

//
// MessageId: STATUS_CANNOT_ACCEPT_TRANSACTED_WORK
//
// MessageText:
//
// The transactional resource manager cannot currently accept transacted work due to a transient condition such as low resources.
//
  {$EXTERNALSYM STATUS_CANNOT_ACCEPT_TRANSACTED_WORK}
  STATUS_CANNOT_ACCEPT_TRANSACTED_WORK =  TNTStatus($C019004C);

//
// MessageId: STATUS_CANNOT_ABORT_TRANSACTIONS
//
// MessageText:
//
// The transactional resource manager had too many tranactions outstanding that could not be aborted.  The transactional resource manger has been shut down.
//
  {$EXTERNALSYM STATUS_CANNOT_ABORT_TRANSACTIONS}
  STATUS_CANNOT_ABORT_TRANSACTIONS =  TNTStatus($C019004D);

//
// MessageId: STATUS_TRANSACTION_NOT_FOUND
//
// MessageText:
//
// The specified Transaction was unable to be opened, because it was not found.
//
  {$EXTERNALSYM STATUS_TRANSACTION_NOT_FOUND}
  STATUS_TRANSACTION_NOT_FOUND     =  TNTStatus($C019004E);

//
// MessageId: STATUS_RESOURCEMANAGER_NOT_FOUND
//
// MessageText:
//
// The specified ResourceManager was unable to be opened, because it was not found.
//
  {$EXTERNALSYM STATUS_RESOURCEMANAGER_NOT_FOUND}
  STATUS_RESOURCEMANAGER_NOT_FOUND =  TNTStatus($C019004F);

//
// MessageId: STATUS_ENLISTMENT_NOT_FOUND
//
// MessageText:
//
// The specified Enlistment was unable to be opened, because it was not found.
//
  {$EXTERNALSYM STATUS_ENLISTMENT_NOT_FOUND}
  STATUS_ENLISTMENT_NOT_FOUND      =  TNTStatus($C0190050);

//
// MessageId: STATUS_TRANSACTIONMANAGER_NOT_FOUND
//
// MessageText:
//
// The specified TransactionManager was unable to be opened, because it was not found.
//
  {$EXTERNALSYM STATUS_TRANSACTIONMANAGER_NOT_FOUND}
  STATUS_TRANSACTIONMANAGER_NOT_FOUND =  TNTStatus($C0190051);

//
// MessageId: STATUS_TRANSACTIONMANAGER_NOT_ONLINE
//
// MessageText:
//
// The specified ResourceManager was unable to create an enlistment, because its associated TransactionManager is not online.
//
  {$EXTERNALSYM STATUS_TRANSACTIONMANAGER_NOT_ONLINE}
  STATUS_TRANSACTIONMANAGER_NOT_ONLINE =  TNTStatus($C0190052);

//
// MessageId: STATUS_TRANSACTIONMANAGER_RECOVERY_NAME_COLLISION
//
// MessageText:
//
// The specified TransactionManager was unable to create the objects contained in its logfile in the Ob namespace.  Therefore, the TransactionManager was unable to recover.
//
  {$EXTERNALSYM STATUS_TRANSACTIONMANAGER_RECOVERY_NAME_COLLISION}
  STATUS_TRANSACTIONMANAGER_RECOVERY_NAME_COLLISION =  TNTStatus($C0190053);

//
// MessageId: STATUS_TRANSACTION_NOT_ROOT
//
// MessageText:
//
// The call to create a superior Enlistment on this Transaction object could not be completed, because the Transaction object specified for the enlistment is a subordinate branch of the Transaction.  Only the root of the Transactoin can be enlisted on as a superior.
//
  {$EXTERNALSYM STATUS_TRANSACTION_NOT_ROOT}
  STATUS_TRANSACTION_NOT_ROOT      =  TNTStatus($C0190054);

//
// MessageId: STATUS_TRANSACTION_OBJECT_EXPIRED
//
// MessageText:
//
// Because the associated transaction manager or resource manager has been closed, the handle is no longer valid.
//
  {$EXTERNALSYM STATUS_TRANSACTION_OBJECT_EXPIRED}
  STATUS_TRANSACTION_OBJECT_EXPIRED =  TNTStatus($C0190055);

//
// MessageId: STATUS_COMPRESSION_NOT_ALLOWED_IN_TRANSACTION
//
// MessageText:
//
// The compression operation could not be completed because a transaction is active on the file.
//
  {$EXTERNALSYM STATUS_COMPRESSION_NOT_ALLOWED_IN_TRANSACTION}
  STATUS_COMPRESSION_NOT_ALLOWED_IN_TRANSACTION =  TNTStatus($C0190056);

//
// MessageId: STATUS_TRANSACTION_RESPONSE_NOT_ENLISTED
//
// MessageText:
//
// The specified operation could not be performed on this Superior enlistment, because the enlistment was not created with the corresponding completion response in the NotificationMask.
//
  {$EXTERNALSYM STATUS_TRANSACTION_RESPONSE_NOT_ENLISTED}
  STATUS_TRANSACTION_RESPONSE_NOT_ENLISTED =  TNTStatus($C0190057);

//
// MessageId: STATUS_TRANSACTION_RECORD_TOO_LONG
//
// MessageText:
//
// The specified operation could not be performed, because the record that would be logged was too long.  This can occur because of two conditions:  either there are too many Enlistments on this Transaction, or the combined RecoveryInformation being logged on behalf of those Enlistments is too long.
//
  {$EXTERNALSYM STATUS_TRANSACTION_RECORD_TOO_LONG}
  STATUS_TRANSACTION_RECORD_TOO_LONG =  TNTStatus($C0190058);

//
// MessageId: STATUS_NO_LINK_TRACKING_IN_TRANSACTION
//
// MessageText:
//
// The link tracking operation could not be completed because a transaction is active.
//
  {$EXTERNALSYM STATUS_NO_LINK_TRACKING_IN_TRANSACTION}
  STATUS_NO_LINK_TRACKING_IN_TRANSACTION =  TNTStatus($C0190059);

//
// MessageId: STATUS_OPERATION_NOT_SUPPORTED_IN_TRANSACTION
//
// MessageText:
//
// This operation cannot be performed in a transaction.
//
  {$EXTERNALSYM STATUS_OPERATION_NOT_SUPPORTED_IN_TRANSACTION}
  STATUS_OPERATION_NOT_SUPPORTED_IN_TRANSACTION =  TNTStatus($C019005A);

//
// MessageId: STATUS_TRANSACTION_INTEGRITY_VIOLATED
//
// MessageText:
//
// The kernel transaction manager had to abort or forget the transaction because it blocked forward progress.
//
  {$EXTERNALSYM STATUS_TRANSACTION_INTEGRITY_VIOLATED}
  STATUS_TRANSACTION_INTEGRITY_VIOLATED =  TNTStatus($C019005B);


//
//  CLFS (common log file system) error values
//

//
// MessageId: STATUS_LOG_SECTOR_INVALID
//
// MessageText:
//
// Log service found an invalid log sector.
//
  {$EXTERNALSYM STATUS_LOG_SECTOR_INVALID}
  STATUS_LOG_SECTOR_INVALID        =  TNTStatus($C01A0001);

//
// MessageId: STATUS_LOG_SECTOR_PARITY_INVALID
//
// MessageText:
//
// Log service encountered a log sector with invalid block parity.
//
  {$EXTERNALSYM STATUS_LOG_SECTOR_PARITY_INVALID}
  STATUS_LOG_SECTOR_PARITY_INVALID =  TNTStatus($C01A0002);

//
// MessageId: STATUS_LOG_SECTOR_REMAPPED
//
// MessageText:
//
// Log service encountered a remapped log sector.
//
  {$EXTERNALSYM STATUS_LOG_SECTOR_REMAPPED}
  STATUS_LOG_SECTOR_REMAPPED       =  TNTStatus($C01A0003);

//
// MessageId: STATUS_LOG_BLOCK_INCOMPLETE
//
// MessageText:
//
// Log service encountered a partial or incomplete log block.
//
  {$EXTERNALSYM STATUS_LOG_BLOCK_INCOMPLETE}
  STATUS_LOG_BLOCK_INCOMPLETE      =  TNTStatus($C01A0004);

//
// MessageId: STATUS_LOG_INVALID_RANGE
//
// MessageText:
//
// Log service encountered an attempt access data outside the active log range.
//
  {$EXTERNALSYM STATUS_LOG_INVALID_RANGE}
  STATUS_LOG_INVALID_RANGE         =  TNTStatus($C01A0005);

//
// MessageId: STATUS_LOG_BLOCKS_EXHAUSTED
//
// MessageText:
//
// Log service user log marshalling buffers are exhausted.
//
  {$EXTERNALSYM STATUS_LOG_BLOCKS_EXHAUSTED}
  STATUS_LOG_BLOCKS_EXHAUSTED      =  TNTStatus($C01A0006);

//
// MessageId: STATUS_LOG_READ_CONTEXT_INVALID
//
// MessageText:
//
// Log service encountered an attempt read from a marshalling area with an invalid read context.
//
  {$EXTERNALSYM STATUS_LOG_READ_CONTEXT_INVALID}
  STATUS_LOG_READ_CONTEXT_INVALID  =  TNTStatus($C01A0007);

//
// MessageId: STATUS_LOG_RESTART_INVALID
//
// MessageText:
//
// Log service encountered an invalid log restart area.
//
  {$EXTERNALSYM STATUS_LOG_RESTART_INVALID}
  STATUS_LOG_RESTART_INVALID       =  TNTStatus($C01A0008);

//
// MessageId: STATUS_LOG_BLOCK_VERSION
//
// MessageText:
//
// Log service encountered an invalid log block version.
//
  {$EXTERNALSYM STATUS_LOG_BLOCK_VERSION}
  STATUS_LOG_BLOCK_VERSION         =  TNTStatus($C01A0009);

//
// MessageId: STATUS_LOG_BLOCK_INVALID
//
// MessageText:
//
// Log service encountered an invalid log block.
//
  {$EXTERNALSYM STATUS_LOG_BLOCK_INVALID}
  STATUS_LOG_BLOCK_INVALID         =  TNTStatus($C01A000A);

//
// MessageId: STATUS_LOG_READ_MODE_INVALID
//
// MessageText:
//
// Log service encountered an attempt to read the log with an invalid read mode.
//
  {$EXTERNALSYM STATUS_LOG_READ_MODE_INVALID}
  STATUS_LOG_READ_MODE_INVALID     =  TNTStatus($C01A000B);

//
// MessageId: STATUS_LOG_NO_RESTART
//
// MessageText:
//
// Log service encountered a log stream with no restart area.
//
  {$EXTERNALSYM STATUS_LOG_NO_RESTART}
  STATUS_LOG_NO_RESTART            =  TNTStatus($401A000C);

//
// MessageId: STATUS_LOG_METADATA_CORRUPT
//
// MessageText:
//
// Log service encountered a corrupted metadata file.
//
  {$EXTERNALSYM STATUS_LOG_METADATA_CORRUPT}
  STATUS_LOG_METADATA_CORRUPT      =  TNTStatus($C01A000D);

//
// MessageId: STATUS_LOG_METADATA_INVALID
//
// MessageText:
//
// Log service encountered a metadata file that could not be created by the log file system.
//
  {$EXTERNALSYM STATUS_LOG_METADATA_INVALID}
  STATUS_LOG_METADATA_INVALID      =  TNTStatus($C01A000E);

//
// MessageId: STATUS_LOG_METADATA_INCONSISTENT
//
// MessageText:
//
// Log service encountered a metadata file with inconsistent data.
//
  {$EXTERNALSYM STATUS_LOG_METADATA_INCONSISTENT}
  STATUS_LOG_METADATA_INCONSISTENT =  TNTStatus($C01A000F);

//
// MessageId: STATUS_LOG_RESERVATION_INVALID
//
// MessageText:
//
// Log service encountered an attempt to erroneously allocate or dispose reservation space.
//
  {$EXTERNALSYM STATUS_LOG_RESERVATION_INVALID}
  STATUS_LOG_RESERVATION_INVALID   =  TNTStatus($C01A0010);

//
// MessageId: STATUS_LOG_CANT_DELETE
//
// MessageText:
//
// Log service cannot delete log file or file system container.
//
  {$EXTERNALSYM STATUS_LOG_CANT_DELETE}
  STATUS_LOG_CANT_DELETE           =  TNTStatus($C01A0011);

//
// MessageId: STATUS_LOG_CONTAINER_LIMIT_EXCEEDED
//
// MessageText:
//
// Log service has reached the maximum allowable containers allocated to a log file.
//
  {$EXTERNALSYM STATUS_LOG_CONTAINER_LIMIT_EXCEEDED}
  STATUS_LOG_CONTAINER_LIMIT_EXCEEDED =  TNTStatus($C01A0012);

//
// MessageId: STATUS_LOG_START_OF_LOG
//
// MessageText:
//
// Log service has attempted to read or write backwards past the start of the log.
//
  {$EXTERNALSYM STATUS_LOG_START_OF_LOG}
  STATUS_LOG_START_OF_LOG          =  TNTStatus($C01A0013);

//
// MessageId: STATUS_LOG_POLICY_ALREADY_INSTALLED
//
// MessageText:
//
// Log policy could not be installed because a policy of the same type is already present.
//
  {$EXTERNALSYM STATUS_LOG_POLICY_ALREADY_INSTALLED}
  STATUS_LOG_POLICY_ALREADY_INSTALLED =  TNTStatus($C01A0014);

//
// MessageId: STATUS_LOG_POLICY_NOT_INSTALLED
//
// MessageText:
//
// Log policy in question was not installed at the time of the request.
//
  {$EXTERNALSYM STATUS_LOG_POLICY_NOT_INSTALLED}
  STATUS_LOG_POLICY_NOT_INSTALLED  =  TNTStatus($C01A0015);

//
// MessageId: STATUS_LOG_POLICY_INVALID
//
// MessageText:
//
// The installed set of policies on the log is invalid.
//
  {$EXTERNALSYM STATUS_LOG_POLICY_INVALID}
  STATUS_LOG_POLICY_INVALID        =  TNTStatus($C01A0016);

//
// MessageId: STATUS_LOG_POLICY_CONFLICT
//
// MessageText:
//
// A policy on the log in question prevented the operation from completing.
//
  {$EXTERNALSYM STATUS_LOG_POLICY_CONFLICT}
  STATUS_LOG_POLICY_CONFLICT       =  TNTStatus($C01A0017);

//
// MessageId: STATUS_LOG_PINNED_ARCHIVE_TAIL
//
// MessageText:
//
// Log space cannot be reclaimed because the log is pinned by the archive tail.
//
  {$EXTERNALSYM STATUS_LOG_PINNED_ARCHIVE_TAIL}
  STATUS_LOG_PINNED_ARCHIVE_TAIL   =  TNTStatus($C01A0018);

//
// MessageId: STATUS_LOG_RECORD_NONEXISTENT
//
// MessageText:
//
// Log record is not a record in the log file.
//
  {$EXTERNALSYM STATUS_LOG_RECORD_NONEXISTENT}
  STATUS_LOG_RECORD_NONEXISTENT    =  TNTStatus($C01A0019);

//
// MessageId: STATUS_LOG_RECORDS_RESERVED_INVALID
//
// MessageText:
//
// Number of reserved log records or the adjustment of the number of reserved log records is invalid.
//
  {$EXTERNALSYM STATUS_LOG_RECORDS_RESERVED_INVALID}
  STATUS_LOG_RECORDS_RESERVED_INVALID =  TNTStatus($C01A001A);

//
// MessageId: STATUS_LOG_SPACE_RESERVED_INVALID
//
// MessageText:
//
// Reserved log space or the adjustment of the log space is invalid.
//
  {$EXTERNALSYM STATUS_LOG_SPACE_RESERVED_INVALID}
  STATUS_LOG_SPACE_RESERVED_INVALID =  TNTStatus($C01A001B);

//
// MessageId: STATUS_LOG_TAIL_INVALID
//
// MessageText:
//
// A new or existing archive tail or base of the active log is invalid.
//
  {$EXTERNALSYM STATUS_LOG_TAIL_INVALID}
  STATUS_LOG_TAIL_INVALID          =  TNTStatus($C01A001C);

//
// MessageId: STATUS_LOG_FULL
//
// MessageText:
//
// Log space is exhausted.
//
  {$EXTERNALSYM STATUS_LOG_FULL}
  STATUS_LOG_FULL                  =  TNTStatus($C01A001D);

//
// MessageId: STATUS_LOG_MULTIPLEXED
//
// MessageText:
//
// Log is multiplexed, no direct writes to the physical log is allowed.
//
  {$EXTERNALSYM STATUS_LOG_MULTIPLEXED}
  STATUS_LOG_MULTIPLEXED           =  TNTStatus($C01A001E);

//
// MessageId: STATUS_LOG_DEDICATED
//
// MessageText:
//
// The operation failed because the log is a dedicated log.
//
  {$EXTERNALSYM STATUS_LOG_DEDICATED}
  STATUS_LOG_DEDICATED             =  TNTStatus($C01A001F);

//
// MessageId: STATUS_LOG_ARCHIVE_NOT_IN_PROGRESS
//
// MessageText:
//
// The operation requires an archive context.
//
  {$EXTERNALSYM STATUS_LOG_ARCHIVE_NOT_IN_PROGRESS}
  STATUS_LOG_ARCHIVE_NOT_IN_PROGRESS =  TNTStatus($C01A0020);

//
// MessageId: STATUS_LOG_ARCHIVE_IN_PROGRESS
//
// MessageText:
//
// Log archival is in progress.
//
  {$EXTERNALSYM STATUS_LOG_ARCHIVE_IN_PROGRESS}
  STATUS_LOG_ARCHIVE_IN_PROGRESS   =  TNTStatus($C01A0021);

//
// MessageId: STATUS_LOG_EPHEMERAL
//
// MessageText:
//
// The operation requires a non-ephemeral log, but the log is ephemeral.
//
  {$EXTERNALSYM STATUS_LOG_EPHEMERAL}
  STATUS_LOG_EPHEMERAL             =  TNTStatus($C01A0022);

//
// MessageId: STATUS_LOG_NOT_ENOUGH_CONTAINERS
//
// MessageText:
//
// The log must have at least two containers before it can be read from or written to.
//
  {$EXTERNALSYM STATUS_LOG_NOT_ENOUGH_CONTAINERS}
  STATUS_LOG_NOT_ENOUGH_CONTAINERS =  TNTStatus($C01A0023);

//
// MessageId: STATUS_LOG_CLIENT_ALREADY_REGISTERED
//
// MessageText:
//
// A log client has already registered on the stream.
//
  {$EXTERNALSYM STATUS_LOG_CLIENT_ALREADY_REGISTERED}
  STATUS_LOG_CLIENT_ALREADY_REGISTERED =  TNTStatus($C01A0024);

//
// MessageId: STATUS_LOG_CLIENT_NOT_REGISTERED
//
// MessageText:
//
// A log client has not been registered on the stream.
//
  {$EXTERNALSYM STATUS_LOG_CLIENT_NOT_REGISTERED}
  STATUS_LOG_CLIENT_NOT_REGISTERED =  TNTStatus($C01A0025);

//
// MessageId: STATUS_LOG_FULL_HANDLER_IN_PROGRESS
//
// MessageText:
//
// A request has already been made to handle the log full condition.
//
  {$EXTERNALSYM STATUS_LOG_FULL_HANDLER_IN_PROGRESS}
  STATUS_LOG_FULL_HANDLER_IN_PROGRESS =  TNTStatus($C01A0026);

//
// MessageId: STATUS_LOG_CONTAINER_READ_FAILED
//
// MessageText:
//
// Log service enountered an error when attempting to read from a log container.
//
  {$EXTERNALSYM STATUS_LOG_CONTAINER_READ_FAILED}
  STATUS_LOG_CONTAINER_READ_FAILED =  TNTStatus($C01A0027);

//
// MessageId: STATUS_LOG_CONTAINER_WRITE_FAILED
//
// MessageText:
//
// Log service enountered an error when attempting to write to a log container.
//
  {$EXTERNALSYM STATUS_LOG_CONTAINER_WRITE_FAILED}
  STATUS_LOG_CONTAINER_WRITE_FAILED =  TNTStatus($C01A0028);

//
// MessageId: STATUS_LOG_CONTAINER_OPEN_FAILED
//
// MessageText:
//
// Log service enountered an error when attempting open a log container.
//
  {$EXTERNALSYM STATUS_LOG_CONTAINER_OPEN_FAILED}
  STATUS_LOG_CONTAINER_OPEN_FAILED =  TNTStatus($C01A0029);

//
// MessageId: STATUS_LOG_CONTAINER_STATE_INVALID
//
// MessageText:
//
// Log service enountered an invalid container state when attempting a requested action.
//
  {$EXTERNALSYM STATUS_LOG_CONTAINER_STATE_INVALID}
  STATUS_LOG_CONTAINER_STATE_INVALID =  TNTStatus($C01A002A);

//
// MessageId: STATUS_LOG_STATE_INVALID
//
// MessageText:
//
// Log service is not in the correct state to perform a requested action.
//
  {$EXTERNALSYM STATUS_LOG_STATE_INVALID}
  STATUS_LOG_STATE_INVALID         =  TNTStatus($C01A002B);

//
// MessageId: STATUS_LOG_PINNED
//
// MessageText:
//
// Log space cannot be reclaimed because the log is pinned.
//
  {$EXTERNALSYM STATUS_LOG_PINNED}
  STATUS_LOG_PINNED                =  TNTStatus($C01A002C);

//
// MessageId: STATUS_LOG_METADATA_FLUSH_FAILED
//
// MessageText:
//
// Log metadata flush failed.
//
  {$EXTERNALSYM STATUS_LOG_METADATA_FLUSH_FAILED}
  STATUS_LOG_METADATA_FLUSH_FAILED =  TNTStatus($C01A002D);

//
// MessageId: STATUS_LOG_INCONSISTENT_SECURITY
//
// MessageText:
//
// Security on the log and its containers is inconsistent.
//
  {$EXTERNALSYM STATUS_LOG_INCONSISTENT_SECURITY}
  STATUS_LOG_INCONSISTENT_SECURITY =  TNTStatus($C01A002E);

//
// MessageId: STATUS_LOG_APPENDED_FLUSH_FAILED
//
// MessageText:
//
// Records were appended to the log or reservation changes were made, but the log could not be flushed.
//
  {$EXTERNALSYM STATUS_LOG_APPENDED_FLUSH_FAILED}
  STATUS_LOG_APPENDED_FLUSH_FAILED =  TNTStatus($C01A002F);

//
// MessageId: STATUS_LOG_PINNED_RESERVATION
//
// MessageText:
//
// The log is pinned due to reservation consuming most of the log space.  Free some reserved records to make space available.
//
  {$EXTERNALSYM STATUS_LOG_PINNED_RESERVATION}
  STATUS_LOG_PINNED_RESERVATION    =  TNTStatus($C01A0030);


//
// XDDM Video Facility Error codes (videoprt.sys)
//

//
// MessageId: STATUS_VIDEO_HUNG_DISPLAY_DRIVER_THREAD
//
// MessageText:
//
// {Display Driver Stopped Responding}
// The %hs display driver has stopped working normally. Save your work and reboot the system to restore full display functionality. The next time you reboot the machine a dialog will be displayed giving you a chance to upload data about this failure to Microsoft.
//
  {$EXTERNALSYM STATUS_VIDEO_HUNG_DISPLAY_DRIVER_THREAD}
  STATUS_VIDEO_HUNG_DISPLAY_DRIVER_THREAD =  TNTStatus($C01B00EA);

//
// MessageId: STATUS_VIDEO_HUNG_DISPLAY_DRIVER_THREAD_RECOVERED
//
// MessageText:
//
// {Display Driver Stopped Responding and recovered}
// The %hs display driver has stopped working normally. The recovery had been performed.
//
  {$EXTERNALSYM STATUS_VIDEO_HUNG_DISPLAY_DRIVER_THREAD_RECOVERED}
  STATUS_VIDEO_HUNG_DISPLAY_DRIVER_THREAD_RECOVERED =  TNTStatus($801B00EB);

//
// MessageId: STATUS_VIDEO_DRIVER_DEBUG_REPORT_REQUEST
//
// MessageText:
//
// {Display Driver Recovered From Failure}
// The %hs display driver has detected and recovered from a failure. Some graphical operations may have failed. The next time you reboot the machine a dialog will be displayed giving you a chance to upload data about this failure to Microsoft.
//
  {$EXTERNALSYM STATUS_VIDEO_DRIVER_DEBUG_REPORT_REQUEST}
  STATUS_VIDEO_DRIVER_DEBUG_REPORT_REQUEST =  TNTStatus($401B00EC);


//
// Monitor Facility Error codes (monitor.sys)
//

//
// MessageId: STATUS_MONITOR_NO_DESCRIPTOR
//
// MessageText:
//
// Monitor descriptor could not be obtained.
//
  {$EXTERNALSYM STATUS_MONITOR_NO_DESCRIPTOR}
  STATUS_MONITOR_NO_DESCRIPTOR     =  TNTStatus($C01D0001);

//
// MessageId: STATUS_MONITOR_UNKNOWN_DESCRIPTOR_FORMAT
//
// MessageText:
//
// Format of the obtained monitor descriptor is not supported by this release.
//
  {$EXTERNALSYM STATUS_MONITOR_UNKNOWN_DESCRIPTOR_FORMAT}
  STATUS_MONITOR_UNKNOWN_DESCRIPTOR_FORMAT =  TNTStatus($C01D0002);

//
// MessageId: STATUS_MONITOR_INVALID_DESCRIPTOR_CHECKSUM
//
// MessageText:
//
// Checksum of the obtained monitor descriptor is invalid.
//
  {$EXTERNALSYM STATUS_MONITOR_INVALID_DESCRIPTOR_CHECKSUM}
  STATUS_MONITOR_INVALID_DESCRIPTOR_CHECKSUM =  TNTStatus($C01D0003);

//
// MessageId: STATUS_MONITOR_INVALID_STANDARD_TIMING_BLOCK
//
// MessageText:
//
// Monitor descriptor contains an invalid standard timing block.
//
  {$EXTERNALSYM STATUS_MONITOR_INVALID_STANDARD_TIMING_BLOCK}
  STATUS_MONITOR_INVALID_STANDARD_TIMING_BLOCK =  TNTStatus($C01D0004);

//
// MessageId: STATUS_MONITOR_WMI_DATABLOCK_REGISTRATION_FAILED
//
// MessageText:
//
// WMI data block registration failed for one of the MSMonitorClass WMI subclasses.
//
  {$EXTERNALSYM STATUS_MONITOR_WMI_DATABLOCK_REGISTRATION_FAILED}
  STATUS_MONITOR_WMI_DATABLOCK_REGISTRATION_FAILED =  TNTStatus($C01D0005);

//
// MessageId: STATUS_MONITOR_INVALID_SERIAL_NUMBER_MONDSC_BLOCK
//
// MessageText:
//
// Provided monitor descriptor block is either corrupted or does not contain monitor's detailed serial number.
//
  {$EXTERNALSYM STATUS_MONITOR_INVALID_SERIAL_NUMBER_MONDSC_BLOCK}
  STATUS_MONITOR_INVALID_SERIAL_NUMBER_MONDSC_BLOCK =  TNTStatus($C01D0006);

//
// MessageId: STATUS_MONITOR_INVALID_USER_FRIENDLY_MONDSC_BLOCK
//
// MessageText:
//
// Provided monitor descriptor block is either corrupted or does not contain monitor's user friendly name.
//
  {$EXTERNALSYM STATUS_MONITOR_INVALID_USER_FRIENDLY_MONDSC_BLOCK}
  STATUS_MONITOR_INVALID_USER_FRIENDLY_MONDSC_BLOCK =  TNTStatus($C01D0007);

//
// MessageId: STATUS_MONITOR_NO_MORE_DESCRIPTOR_DATA
//
// MessageText:
//
// There is no monitor descriptor data at the specified (offset, size) region.
//
  {$EXTERNALSYM STATUS_MONITOR_NO_MORE_DESCRIPTOR_DATA}
  STATUS_MONITOR_NO_MORE_DESCRIPTOR_DATA =  TNTStatus($C01D0008);

//
// MessageId: STATUS_MONITOR_INVALID_DETAILED_TIMING_BLOCK
//
// MessageText:
//
// Monitor descriptor contains an invalid detailed timing block.
//
  {$EXTERNALSYM STATUS_MONITOR_INVALID_DETAILED_TIMING_BLOCK}
  STATUS_MONITOR_INVALID_DETAILED_TIMING_BLOCK =  TNTStatus($C01D0009);


//
// Graphics Facility Error codes (dxg.sys, dxgkrnl.sys)
//

//
//   Common Windows Graphics Kernel Subsystem status codes {0x0000..0x00ff}
//
//
// MessageId: STATUS_GRAPHICS_NOT_EXCLUSIVE_MODE_OWNER
//
// MessageText:
//
// Exclusive mode ownership is needed to create unmanaged primary allocation.
//
  {$EXTERNALSYM STATUS_GRAPHICS_NOT_EXCLUSIVE_MODE_OWNER}
  STATUS_GRAPHICS_NOT_EXCLUSIVE_MODE_OWNER =  TNTStatus($C01E0000);

//
// MessageId: STATUS_GRAPHICS_INSUFFICIENT_DMA_BUFFER
//
// MessageText:
//
// The driver needs more DMA buffer space in order to complete the requested operation.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INSUFFICIENT_DMA_BUFFER}
  STATUS_GRAPHICS_INSUFFICIENT_DMA_BUFFER =  TNTStatus($C01E0001);

//
// MessageId: STATUS_GRAPHICS_INVALID_DISPLAY_ADAPTER
//
// MessageText:
//
// Specified display adapter handle is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_DISPLAY_ADAPTER}
  STATUS_GRAPHICS_INVALID_DISPLAY_ADAPTER =  TNTStatus($C01E0002);

//
// MessageId: STATUS_GRAPHICS_ADAPTER_WAS_RESET
//
// MessageText:
//
// Specified display adapter and all of its state has been reset.
//
  {$EXTERNALSYM STATUS_GRAPHICS_ADAPTER_WAS_RESET}
  STATUS_GRAPHICS_ADAPTER_WAS_RESET =  TNTStatus($C01E0003);

//
// MessageId: STATUS_GRAPHICS_INVALID_DRIVER_MODEL
//
// MessageText:
//
// The driver stack doesn't match the expected driver model.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_DRIVER_MODEL}
  STATUS_GRAPHICS_INVALID_DRIVER_MODEL =  TNTStatus($C01E0004);

//
// MessageId: STATUS_GRAPHICS_PRESENT_MODE_CHANGED
//
// MessageText:
//
// Present happened but ended up into the changed desktop mode
//
  {$EXTERNALSYM STATUS_GRAPHICS_PRESENT_MODE_CHANGED}
  STATUS_GRAPHICS_PRESENT_MODE_CHANGED =  TNTStatus($C01E0005);

//
// MessageId: STATUS_GRAPHICS_PRESENT_OCCLUDED
//
// MessageText:
//
// Nothing to present due to desktop occlusion
//
  {$EXTERNALSYM STATUS_GRAPHICS_PRESENT_OCCLUDED}
  STATUS_GRAPHICS_PRESENT_OCCLUDED =  TNTStatus($C01E0006);

//
// MessageId: STATUS_GRAPHICS_PRESENT_DENIED
//
// MessageText:
//
// Not able to present due to denial of desktop access
//
  {$EXTERNALSYM STATUS_GRAPHICS_PRESENT_DENIED}
  STATUS_GRAPHICS_PRESENT_DENIED   =  TNTStatus($C01E0007);

//
// MessageId: STATUS_GRAPHICS_CANNOTCOLORCONVERT
//
// MessageText:
//
// Not able to present with color convertion
//
  {$EXTERNALSYM STATUS_GRAPHICS_CANNOTCOLORCONVERT}
  STATUS_GRAPHICS_CANNOTCOLORCONVERT =  TNTStatus($C01E0008);

//
// MessageId: STATUS_GRAPHICS_DRIVER_MISMATCH
//
// MessageText:
//
// The kernel driver detected a version mismatch between it and the user mode driver.
//
  {$EXTERNALSYM STATUS_GRAPHICS_DRIVER_MISMATCH}
  STATUS_GRAPHICS_DRIVER_MISMATCH  =  TNTStatus($C01E0009);

//
// MessageId: STATUS_GRAPHICS_PARTIAL_DATA_POPULATED
//
// MessageText:
//
// Specified buffer is not big enough to contain entire requested dataset. Partial data populated upto the size of the buffer.
// Caller needs to provide buffer of size as specified in the partially populated buffer's content (interface specific).
//
  {$EXTERNALSYM STATUS_GRAPHICS_PARTIAL_DATA_POPULATED}
  STATUS_GRAPHICS_PARTIAL_DATA_POPULATED =  TNTStatus($401E000A);

//
//   Video Memory Manager (VidMM) specific status codes {0x0100..0x01ff}
//
//
// MessageId: STATUS_GRAPHICS_NO_VIDEO_MEMORY
//
// MessageText:
//
// Not enough video memory available to complete the operation.
//
  {$EXTERNALSYM STATUS_GRAPHICS_NO_VIDEO_MEMORY}
  STATUS_GRAPHICS_NO_VIDEO_MEMORY  =  TNTStatus($C01E0100);

//
// MessageId: STATUS_GRAPHICS_CANT_LOCK_MEMORY
//
// MessageText:
//
// Couldn't probe and lock the underlying memory of an allocation.
//
  {$EXTERNALSYM STATUS_GRAPHICS_CANT_LOCK_MEMORY}
  STATUS_GRAPHICS_CANT_LOCK_MEMORY =  TNTStatus($C01E0101);

//
// MessageId: STATUS_GRAPHICS_ALLOCATION_BUSY
//
// MessageText:
//
// The allocation is currently busy.
//
  {$EXTERNALSYM STATUS_GRAPHICS_ALLOCATION_BUSY}
  STATUS_GRAPHICS_ALLOCATION_BUSY  =  TNTStatus($C01E0102);

//
// MessageId: STATUS_GRAPHICS_TOO_MANY_REFERENCES
//
// MessageText:
//
// An object being referenced has already reached the maximum reference count and can't be referenced any further.
//
  {$EXTERNALSYM STATUS_GRAPHICS_TOO_MANY_REFERENCES}
  STATUS_GRAPHICS_TOO_MANY_REFERENCES =  TNTStatus($C01E0103);

//
// MessageId: STATUS_GRAPHICS_TRY_AGAIN_LATER
//
// MessageText:
//
// A problem couldn't be solved due to some currently existing condition. The problem should be tried again later.
//
  {$EXTERNALSYM STATUS_GRAPHICS_TRY_AGAIN_LATER}
  STATUS_GRAPHICS_TRY_AGAIN_LATER  =  TNTStatus($C01E0104);

//
// MessageId: STATUS_GRAPHICS_TRY_AGAIN_NOW
//
// MessageText:
//
// A problem couldn't be solved due to some currently existing condition. The problem should be tried again immediately.
//
  {$EXTERNALSYM STATUS_GRAPHICS_TRY_AGAIN_NOW}
  STATUS_GRAPHICS_TRY_AGAIN_NOW    =  TNTStatus($C01E0105);

//
// MessageId: STATUS_GRAPHICS_ALLOCATION_INVALID
//
// MessageText:
//
// The allocation is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_ALLOCATION_INVALID}
  STATUS_GRAPHICS_ALLOCATION_INVALID =  TNTStatus($C01E0106);

//
// MessageId: STATUS_GRAPHICS_UNSWIZZLING_APERTURE_UNAVAILABLE
//
// MessageText:
//
// No more unswizzling aperture are currently available.
//
  {$EXTERNALSYM STATUS_GRAPHICS_UNSWIZZLING_APERTURE_UNAVAILABLE}
  STATUS_GRAPHICS_UNSWIZZLING_APERTURE_UNAVAILABLE =  TNTStatus($C01E0107);

//
// MessageId: STATUS_GRAPHICS_UNSWIZZLING_APERTURE_UNSUPPORTED
//
// MessageText:
//
// The current allocation can't be unswizzled by an aperture.
//
  {$EXTERNALSYM STATUS_GRAPHICS_UNSWIZZLING_APERTURE_UNSUPPORTED}
  STATUS_GRAPHICS_UNSWIZZLING_APERTURE_UNSUPPORTED =  TNTStatus($C01E0108);

//
// MessageId: STATUS_GRAPHICS_CANT_EVICT_PINNED_ALLOCATION
//
// MessageText:
//
// The request failed because a pinned allocation can't be evicted.
//
  {$EXTERNALSYM STATUS_GRAPHICS_CANT_EVICT_PINNED_ALLOCATION}
  STATUS_GRAPHICS_CANT_EVICT_PINNED_ALLOCATION =  TNTStatus($C01E0109);

//
// MessageId: STATUS_GRAPHICS_INVALID_ALLOCATION_USAGE
//
// MessageText:
//
// The allocation can't be used from it's current segment location for the specified operation.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_ALLOCATION_USAGE}
  STATUS_GRAPHICS_INVALID_ALLOCATION_USAGE =  TNTStatus($C01E0110);

//
// MessageId: STATUS_GRAPHICS_CANT_RENDER_LOCKED_ALLOCATION
//
// MessageText:
//
// A locked allocation can't be used in the current command buffer.
//
  {$EXTERNALSYM STATUS_GRAPHICS_CANT_RENDER_LOCKED_ALLOCATION}
  STATUS_GRAPHICS_CANT_RENDER_LOCKED_ALLOCATION =  TNTStatus($C01E0111);

//
// MessageId: STATUS_GRAPHICS_ALLOCATION_CLOSED
//
// MessageText:
//
// The allocation being referenced has been closed permanently.
//
  {$EXTERNALSYM STATUS_GRAPHICS_ALLOCATION_CLOSED}
  STATUS_GRAPHICS_ALLOCATION_CLOSED =  TNTStatus($C01E0112);

//
// MessageId: STATUS_GRAPHICS_INVALID_ALLOCATION_INSTANCE
//
// MessageText:
//
// An invalid allocation instance is being referenced.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_ALLOCATION_INSTANCE}
  STATUS_GRAPHICS_INVALID_ALLOCATION_INSTANCE =  TNTStatus($C01E0113);

//
// MessageId: STATUS_GRAPHICS_INVALID_ALLOCATION_HANDLE
//
// MessageText:
//
// An invalid allocation handle is being referenced.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_ALLOCATION_HANDLE}
  STATUS_GRAPHICS_INVALID_ALLOCATION_HANDLE =  TNTStatus($C01E0114);

//
// MessageId: STATUS_GRAPHICS_WRONG_ALLOCATION_DEVICE
//
// MessageText:
//
// The allocation being referenced doesn't belong to the current device.
//
  {$EXTERNALSYM STATUS_GRAPHICS_WRONG_ALLOCATION_DEVICE}
  STATUS_GRAPHICS_WRONG_ALLOCATION_DEVICE =  TNTStatus($C01E0115);

//
// MessageId: STATUS_GRAPHICS_ALLOCATION_CONTENT_LOST
//
// MessageText:
//
// The specified allocation lost its content.
//
  {$EXTERNALSYM STATUS_GRAPHICS_ALLOCATION_CONTENT_LOST}
  STATUS_GRAPHICS_ALLOCATION_CONTENT_LOST =  TNTStatus($C01E0116);

//
//   Video GPU Scheduler (VidSch) specific status codes {0x0200..0x02ff}
//
//
// MessageId: STATUS_GRAPHICS_GPU_EXCEPTION_ON_DEVICE
//
// MessageText:
//
// GPU exception is detected on the given device. The device is not able to be scheduled.
//
  {$EXTERNALSYM STATUS_GRAPHICS_GPU_EXCEPTION_ON_DEVICE}
  STATUS_GRAPHICS_GPU_EXCEPTION_ON_DEVICE =  TNTStatus($C01E0200);

//
//   Video Present Network Management (VidPNMgr) specific status codes {0x0300..0x03ff}
//
//
// MessageId: STATUS_GRAPHICS_INVALID_VIDPN_TOPOLOGY
//
// MessageText:
//
// Specified VidPN topology is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_VIDPN_TOPOLOGY}
  STATUS_GRAPHICS_INVALID_VIDPN_TOPOLOGY =  TNTStatus($C01E0300);

//
// MessageId: STATUS_GRAPHICS_VIDPN_TOPOLOGY_NOT_SUPPORTED
//
// MessageText:
//
// Specified VidPN topology is valid but is not supported by this model of the display adapter.
//
  {$EXTERNALSYM STATUS_GRAPHICS_VIDPN_TOPOLOGY_NOT_SUPPORTED}
  STATUS_GRAPHICS_VIDPN_TOPOLOGY_NOT_SUPPORTED =  TNTStatus($C01E0301);

//
// MessageId: STATUS_GRAPHICS_VIDPN_TOPOLOGY_CURRENTLY_NOT_SUPPORTED
//
// MessageText:
//
// Specified VidPN topology is valid but is not supported by the display adapter at this time, due to current allocation of its resources.
//
  {$EXTERNALSYM STATUS_GRAPHICS_VIDPN_TOPOLOGY_CURRENTLY_NOT_SUPPORTED}
  STATUS_GRAPHICS_VIDPN_TOPOLOGY_CURRENTLY_NOT_SUPPORTED =  TNTStatus($C01E0302);

//
// MessageId: STATUS_GRAPHICS_INVALID_VIDPN
//
// MessageText:
//
// Specified VidPN handle is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_VIDPN}
  STATUS_GRAPHICS_INVALID_VIDPN    =  TNTStatus($C01E0303);

//
// MessageId: STATUS_GRAPHICS_INVALID_VIDEO_PRESENT_SOURCE
//
// MessageText:
//
// Specified video present source is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_VIDEO_PRESENT_SOURCE}
  STATUS_GRAPHICS_INVALID_VIDEO_PRESENT_SOURCE =  TNTStatus($C01E0304);

//
// MessageId: STATUS_GRAPHICS_INVALID_VIDEO_PRESENT_TARGET
//
// MessageText:
//
// Specified video present target is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_VIDEO_PRESENT_TARGET}
  STATUS_GRAPHICS_INVALID_VIDEO_PRESENT_TARGET =  TNTStatus($C01E0305);

//
// MessageId: STATUS_GRAPHICS_VIDPN_MODALITY_NOT_SUPPORTED
//
// MessageText:
//
// Specified VidPN modality is not supported (e.g. at least two of the pinned modes are not cofunctional).
//
  {$EXTERNALSYM STATUS_GRAPHICS_VIDPN_MODALITY_NOT_SUPPORTED}
  STATUS_GRAPHICS_VIDPN_MODALITY_NOT_SUPPORTED =  TNTStatus($C01E0306);

//
// MessageId: STATUS_GRAPHICS_MODE_NOT_PINNED
//
// MessageText:
//
// No mode is pinned on the specified VidPN source/target.
//
  {$EXTERNALSYM STATUS_GRAPHICS_MODE_NOT_PINNED}
  STATUS_GRAPHICS_MODE_NOT_PINNED  =  TNTStatus($401E0307);

//
// MessageId: STATUS_GRAPHICS_INVALID_VIDPN_SOURCEMODESET
//
// MessageText:
//
// Specified VidPN source mode set is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_VIDPN_SOURCEMODESET}
  STATUS_GRAPHICS_INVALID_VIDPN_SOURCEMODESET =  TNTStatus($C01E0308);

//
// MessageId: STATUS_GRAPHICS_INVALID_VIDPN_TARGETMODESET
//
// MessageText:
//
// Specified VidPN target mode set is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_VIDPN_TARGETMODESET}
  STATUS_GRAPHICS_INVALID_VIDPN_TARGETMODESET =  TNTStatus($C01E0309);

//
// MessageId: STATUS_GRAPHICS_INVALID_FREQUENCY
//
// MessageText:
//
// Specified video signal frequency is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_FREQUENCY}
  STATUS_GRAPHICS_INVALID_FREQUENCY =  TNTStatus($C01E030A);

//
// MessageId: STATUS_GRAPHICS_INVALID_ACTIVE_REGION
//
// MessageText:
//
// Specified video signal active region is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_ACTIVE_REGION}
  STATUS_GRAPHICS_INVALID_ACTIVE_REGION =  TNTStatus($C01E030B);

//
// MessageId: STATUS_GRAPHICS_INVALID_TOTAL_REGION
//
// MessageText:
//
// Specified video signal total region is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_TOTAL_REGION}
  STATUS_GRAPHICS_INVALID_TOTAL_REGION =  TNTStatus($C01E030C);

//
// MessageId: STATUS_GRAPHICS_INVALID_VIDEO_PRESENT_SOURCE_MODE
//
// MessageText:
//
// Specified video present source mode is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_VIDEO_PRESENT_SOURCE_MODE}
  STATUS_GRAPHICS_INVALID_VIDEO_PRESENT_SOURCE_MODE =  TNTStatus($C01E0310);

//
// MessageId: STATUS_GRAPHICS_INVALID_VIDEO_PRESENT_TARGET_MODE
//
// MessageText:
//
// Specified video present target mode is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_VIDEO_PRESENT_TARGET_MODE}
  STATUS_GRAPHICS_INVALID_VIDEO_PRESENT_TARGET_MODE =  TNTStatus($C01E0311);

//
// MessageId: STATUS_GRAPHICS_PINNED_MODE_MUST_REMAIN_IN_SET
//
// MessageText:
//
// Pinned mode must remain in the set on VidPN's cofunctional modality enumeration.
//
  {$EXTERNALSYM STATUS_GRAPHICS_PINNED_MODE_MUST_REMAIN_IN_SET}
  STATUS_GRAPHICS_PINNED_MODE_MUST_REMAIN_IN_SET =  TNTStatus($C01E0312);

//
// MessageId: STATUS_GRAPHICS_PATH_ALREADY_IN_TOPOLOGY
//
// MessageText:
//
// Specified video present path is already in VidPN's topology.
//
  {$EXTERNALSYM STATUS_GRAPHICS_PATH_ALREADY_IN_TOPOLOGY}
  STATUS_GRAPHICS_PATH_ALREADY_IN_TOPOLOGY =  TNTStatus($C01E0313);

//
// MessageId: STATUS_GRAPHICS_MODE_ALREADY_IN_MODESET
//
// MessageText:
//
// Specified mode is already in the mode set.
//
  {$EXTERNALSYM STATUS_GRAPHICS_MODE_ALREADY_IN_MODESET}
  STATUS_GRAPHICS_MODE_ALREADY_IN_MODESET =  TNTStatus($C01E0314);

//
// MessageId: STATUS_GRAPHICS_INVALID_VIDEOPRESENTSOURCESET
//
// MessageText:
//
// Specified video present source set is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_VIDEOPRESENTSOURCESET}
  STATUS_GRAPHICS_INVALID_VIDEOPRESENTSOURCESET =  TNTStatus($C01E0315);

//
// MessageId: STATUS_GRAPHICS_INVALID_VIDEOPRESENTTARGETSET
//
// MessageText:
//
// Specified video present target set is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_VIDEOPRESENTTARGETSET}
  STATUS_GRAPHICS_INVALID_VIDEOPRESENTTARGETSET =  TNTStatus($C01E0316);

//
// MessageId: STATUS_GRAPHICS_SOURCE_ALREADY_IN_SET
//
// MessageText:
//
// Specified video present source is already in the video present source set.
//
  {$EXTERNALSYM STATUS_GRAPHICS_SOURCE_ALREADY_IN_SET}
  STATUS_GRAPHICS_SOURCE_ALREADY_IN_SET =  TNTStatus($C01E0317);

//
// MessageId: STATUS_GRAPHICS_TARGET_ALREADY_IN_SET
//
// MessageText:
//
// Specified video present target is already in the video present target set.
//
  {$EXTERNALSYM STATUS_GRAPHICS_TARGET_ALREADY_IN_SET}
  STATUS_GRAPHICS_TARGET_ALREADY_IN_SET =  TNTStatus($C01E0318);

//
// MessageId: STATUS_GRAPHICS_INVALID_VIDPN_PRESENT_PATH
//
// MessageText:
//
// Specified VidPN present path is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_VIDPN_PRESENT_PATH}
  STATUS_GRAPHICS_INVALID_VIDPN_PRESENT_PATH =  TNTStatus($C01E0319);

//
// MessageId: STATUS_GRAPHICS_NO_RECOMMENDED_VIDPN_TOPOLOGY
//
// MessageText:
//
// Miniport has no recommendation for augmentation of the specified VidPN's topology.
//
  {$EXTERNALSYM STATUS_GRAPHICS_NO_RECOMMENDED_VIDPN_TOPOLOGY}
  STATUS_GRAPHICS_NO_RECOMMENDED_VIDPN_TOPOLOGY =  TNTStatus($C01E031A);

//
// MessageId: STATUS_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGESET
//
// MessageText:
//
// Specified monitor frequency range set is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGESET}
  STATUS_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGESET =  TNTStatus($C01E031B);

//
// MessageId: STATUS_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGE
//
// MessageText:
//
// Specified monitor frequency range is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGE}
  STATUS_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGE =  TNTStatus($C01E031C);

//
// MessageId: STATUS_GRAPHICS_FREQUENCYRANGE_NOT_IN_SET
//
// MessageText:
//
// Specified frequency range is not in the specified monitor frequency range set.
//
  {$EXTERNALSYM STATUS_GRAPHICS_FREQUENCYRANGE_NOT_IN_SET}
  STATUS_GRAPHICS_FREQUENCYRANGE_NOT_IN_SET =  TNTStatus($C01E031D);

//
// MessageId: STATUS_GRAPHICS_NO_PREFERRED_MODE
//
// MessageText:
//
// Specified mode set does not specify preference for one of its modes.
//
  {$EXTERNALSYM STATUS_GRAPHICS_NO_PREFERRED_MODE}
  STATUS_GRAPHICS_NO_PREFERRED_MODE =  TNTStatus($401E031E);

//
// MessageId: STATUS_GRAPHICS_FREQUENCYRANGE_ALREADY_IN_SET
//
// MessageText:
//
// Specified frequency range is already in the specified monitor frequency range set.
//
  {$EXTERNALSYM STATUS_GRAPHICS_FREQUENCYRANGE_ALREADY_IN_SET}
  STATUS_GRAPHICS_FREQUENCYRANGE_ALREADY_IN_SET =  TNTStatus($C01E031F);

//
// MessageId: STATUS_GRAPHICS_STALE_MODESET
//
// MessageText:
//
// Specified mode set is stale. Please reacquire the new mode set.
//
  {$EXTERNALSYM STATUS_GRAPHICS_STALE_MODESET}
  STATUS_GRAPHICS_STALE_MODESET    =  TNTStatus($C01E0320);

//
// MessageId: STATUS_GRAPHICS_INVALID_MONITOR_SOURCEMODESET
//
// MessageText:
//
// Specified monitor source mode set is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_MONITOR_SOURCEMODESET}
  STATUS_GRAPHICS_INVALID_MONITOR_SOURCEMODESET =  TNTStatus($C01E0321);

//
// MessageId: STATUS_GRAPHICS_INVALID_MONITOR_SOURCE_MODE
//
// MessageText:
//
// Specified monitor source mode is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_MONITOR_SOURCE_MODE}
  STATUS_GRAPHICS_INVALID_MONITOR_SOURCE_MODE =  TNTStatus($C01E0322);

//
// MessageId: STATUS_GRAPHICS_NO_RECOMMENDED_FUNCTIONAL_VIDPN
//
// MessageText:
//
// Miniport does not have any recommendation regarding the request to provide a functional VidPN given the current display adapter configuration.
//
  {$EXTERNALSYM STATUS_GRAPHICS_NO_RECOMMENDED_FUNCTIONAL_VIDPN}
  STATUS_GRAPHICS_NO_RECOMMENDED_FUNCTIONAL_VIDPN =  TNTStatus($C01E0323);

//
// MessageId: STATUS_GRAPHICS_MODE_ID_MUST_BE_UNIQUE
//
// MessageText:
//
// ID of the specified mode is already used by another mode in the set.
//
  {$EXTERNALSYM STATUS_GRAPHICS_MODE_ID_MUST_BE_UNIQUE}
  STATUS_GRAPHICS_MODE_ID_MUST_BE_UNIQUE =  TNTStatus($C01E0324);

//
// MessageId: STATUS_GRAPHICS_EMPTY_ADAPTER_MONITOR_MODE_SUPPORT_INTERSECTION
//
// MessageText:
//
// System failed to determine a mode that is supported by both the display adapter and the monitor connected to it.
//
  {$EXTERNALSYM STATUS_GRAPHICS_EMPTY_ADAPTER_MONITOR_MODE_SUPPORT_INTERSECTION}
  STATUS_GRAPHICS_EMPTY_ADAPTER_MONITOR_MODE_SUPPORT_INTERSECTION =  TNTStatus($C01E0325);

//
// MessageId: STATUS_GRAPHICS_VIDEO_PRESENT_TARGETS_LESS_THAN_SOURCES
//
// MessageText:
//
// Number of video present targets must be greater than or equal to the number of video present sources.
//
  {$EXTERNALSYM STATUS_GRAPHICS_VIDEO_PRESENT_TARGETS_LESS_THAN_SOURCES}
  STATUS_GRAPHICS_VIDEO_PRESENT_TARGETS_LESS_THAN_SOURCES =  TNTStatus($C01E0326);

//
// MessageId: STATUS_GRAPHICS_PATH_NOT_IN_TOPOLOGY
//
// MessageText:
//
// Specified present path is not in VidPN's topology.
//
  {$EXTERNALSYM STATUS_GRAPHICS_PATH_NOT_IN_TOPOLOGY}
  STATUS_GRAPHICS_PATH_NOT_IN_TOPOLOGY =  TNTStatus($C01E0327);

//
// MessageId: STATUS_GRAPHICS_ADAPTER_MUST_HAVE_AT_LEAST_ONE_SOURCE
//
// MessageText:
//
// Display adapter must have at least one video present source.
//
  {$EXTERNALSYM STATUS_GRAPHICS_ADAPTER_MUST_HAVE_AT_LEAST_ONE_SOURCE}
  STATUS_GRAPHICS_ADAPTER_MUST_HAVE_AT_LEAST_ONE_SOURCE =  TNTStatus($C01E0328);

//
// MessageId: STATUS_GRAPHICS_ADAPTER_MUST_HAVE_AT_LEAST_ONE_TARGET
//
// MessageText:
//
// Display adapter must have at least one video present target.
//
  {$EXTERNALSYM STATUS_GRAPHICS_ADAPTER_MUST_HAVE_AT_LEAST_ONE_TARGET}
  STATUS_GRAPHICS_ADAPTER_MUST_HAVE_AT_LEAST_ONE_TARGET =  TNTStatus($C01E0329);

//
// MessageId: STATUS_GRAPHICS_INVALID_MONITORDESCRIPTORSET
//
// MessageText:
//
// Specified monitor descriptor set is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_MONITORDESCRIPTORSET}
  STATUS_GRAPHICS_INVALID_MONITORDESCRIPTORSET =  TNTStatus($C01E032A);

//
// MessageId: STATUS_GRAPHICS_INVALID_MONITORDESCRIPTOR
//
// MessageText:
//
// Specified monitor descriptor is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_MONITORDESCRIPTOR}
  STATUS_GRAPHICS_INVALID_MONITORDESCRIPTOR =  TNTStatus($C01E032B);

//
// MessageId: STATUS_GRAPHICS_MONITORDESCRIPTOR_NOT_IN_SET
//
// MessageText:
//
// Specified descriptor is not in the specified monitor descriptor set.
//
  {$EXTERNALSYM STATUS_GRAPHICS_MONITORDESCRIPTOR_NOT_IN_SET}
  STATUS_GRAPHICS_MONITORDESCRIPTOR_NOT_IN_SET =  TNTStatus($C01E032C);

//
// MessageId: STATUS_GRAPHICS_MONITORDESCRIPTOR_ALREADY_IN_SET
//
// MessageText:
//
// Specified descriptor is already in the specified monitor descriptor set.
//
  {$EXTERNALSYM STATUS_GRAPHICS_MONITORDESCRIPTOR_ALREADY_IN_SET}
  STATUS_GRAPHICS_MONITORDESCRIPTOR_ALREADY_IN_SET =  TNTStatus($C01E032D);

//
// MessageId: STATUS_GRAPHICS_MONITORDESCRIPTOR_ID_MUST_BE_UNIQUE
//
// MessageText:
//
// ID of the specified monitor descriptor is already used by another descriptor in the set.
//
  {$EXTERNALSYM STATUS_GRAPHICS_MONITORDESCRIPTOR_ID_MUST_BE_UNIQUE}
  STATUS_GRAPHICS_MONITORDESCRIPTOR_ID_MUST_BE_UNIQUE =  TNTStatus($C01E032E);

//
// MessageId: STATUS_GRAPHICS_INVALID_VIDPN_TARGET_SUBSET_TYPE
//
// MessageText:
//
// Specified video present target subset type is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_VIDPN_TARGET_SUBSET_TYPE}
  STATUS_GRAPHICS_INVALID_VIDPN_TARGET_SUBSET_TYPE =  TNTStatus($C01E032F);

//
// MessageId: STATUS_GRAPHICS_RESOURCES_NOT_RELATED
//
// MessageText:
//
// Two or more of the specified resources are not related to each other, as defined by the interface semantics.
//
  {$EXTERNALSYM STATUS_GRAPHICS_RESOURCES_NOT_RELATED}
  STATUS_GRAPHICS_RESOURCES_NOT_RELATED =  TNTStatus($C01E0330);

//
// MessageId: STATUS_GRAPHICS_SOURCE_ID_MUST_BE_UNIQUE
//
// MessageText:
//
// ID of the specified video present source is already used by another source in the set.
//
  {$EXTERNALSYM STATUS_GRAPHICS_SOURCE_ID_MUST_BE_UNIQUE}
  STATUS_GRAPHICS_SOURCE_ID_MUST_BE_UNIQUE =  TNTStatus($C01E0331);

//
// MessageId: STATUS_GRAPHICS_TARGET_ID_MUST_BE_UNIQUE
//
// MessageText:
//
// ID of the specified video present target is already used by another target in the set.
//
  {$EXTERNALSYM STATUS_GRAPHICS_TARGET_ID_MUST_BE_UNIQUE}
  STATUS_GRAPHICS_TARGET_ID_MUST_BE_UNIQUE =  TNTStatus($C01E0332);

//
// MessageId: STATUS_GRAPHICS_NO_AVAILABLE_VIDPN_TARGET
//
// MessageText:
//
// Specified VidPN source cannot be used because there is no available VidPN target to connect it to.
//
  {$EXTERNALSYM STATUS_GRAPHICS_NO_AVAILABLE_VIDPN_TARGET}
  STATUS_GRAPHICS_NO_AVAILABLE_VIDPN_TARGET =  TNTStatus($C01E0333);

//
// MessageId: STATUS_GRAPHICS_MONITOR_COULD_NOT_BE_ASSOCIATED_WITH_ADAPTER
//
// MessageText:
//
// Newly arrived monitor could not be associated with a display adapter.
//
  {$EXTERNALSYM STATUS_GRAPHICS_MONITOR_COULD_NOT_BE_ASSOCIATED_WITH_ADAPTER}
  STATUS_GRAPHICS_MONITOR_COULD_NOT_BE_ASSOCIATED_WITH_ADAPTER =  TNTStatus($C01E0334);

//
// MessageId: STATUS_GRAPHICS_NO_VIDPNMGR
//
// MessageText:
//
// Display adapter in question does not have an associated VidPN manager.
//
  {$EXTERNALSYM STATUS_GRAPHICS_NO_VIDPNMGR}
  STATUS_GRAPHICS_NO_VIDPNMGR      =  TNTStatus($C01E0335);

//
// MessageId: STATUS_GRAPHICS_NO_ACTIVE_VIDPN
//
// MessageText:
//
// VidPN manager of the display adapter in question does not have an active VidPN.
//
  {$EXTERNALSYM STATUS_GRAPHICS_NO_ACTIVE_VIDPN}
  STATUS_GRAPHICS_NO_ACTIVE_VIDPN  =  TNTStatus($C01E0336);

//
// MessageId: STATUS_GRAPHICS_STALE_VIDPN_TOPOLOGY
//
// MessageText:
//
// Specified VidPN topology is stale. Please reacquire the new topology.
//
  {$EXTERNALSYM STATUS_GRAPHICS_STALE_VIDPN_TOPOLOGY}
  STATUS_GRAPHICS_STALE_VIDPN_TOPOLOGY =  TNTStatus($C01E0337);

//
// MessageId: STATUS_GRAPHICS_MONITOR_NOT_CONNECTED
//
// MessageText:
//
// There is no monitor connected on the specified video present target.
//
  {$EXTERNALSYM STATUS_GRAPHICS_MONITOR_NOT_CONNECTED}
  STATUS_GRAPHICS_MONITOR_NOT_CONNECTED =  TNTStatus($C01E0338);

//
// MessageId: STATUS_GRAPHICS_SOURCE_NOT_IN_TOPOLOGY
//
// MessageText:
//
// Specified source is not part of the specified VidPN's topology.
//
  {$EXTERNALSYM STATUS_GRAPHICS_SOURCE_NOT_IN_TOPOLOGY}
  STATUS_GRAPHICS_SOURCE_NOT_IN_TOPOLOGY =  TNTStatus($C01E0339);

//
// MessageId: STATUS_GRAPHICS_INVALID_PRIMARYSURFACE_SIZE
//
// MessageText:
//
// Specified primary surface size is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_PRIMARYSURFACE_SIZE}
  STATUS_GRAPHICS_INVALID_PRIMARYSURFACE_SIZE =  TNTStatus($C01E033A);

//
// MessageId: STATUS_GRAPHICS_INVALID_VISIBLEREGION_SIZE
//
// MessageText:
//
// Specified visible region size is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_VISIBLEREGION_SIZE}
  STATUS_GRAPHICS_INVALID_VISIBLEREGION_SIZE =  TNTStatus($C01E033B);

//
// MessageId: STATUS_GRAPHICS_INVALID_STRIDE
//
// MessageText:
//
// Specified stride is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_STRIDE}
  STATUS_GRAPHICS_INVALID_STRIDE   =  TNTStatus($C01E033C);

//
// MessageId: STATUS_GRAPHICS_INVALID_PIXELFORMAT
//
// MessageText:
//
// Specified pixel format is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_PIXELFORMAT}
  STATUS_GRAPHICS_INVALID_PIXELFORMAT =  TNTStatus($C01E033D);

//
// MessageId: STATUS_GRAPHICS_INVALID_COLORBASIS
//
// MessageText:
//
// Specified color basis is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_COLORBASIS}
  STATUS_GRAPHICS_INVALID_COLORBASIS =  TNTStatus($C01E033E);

//
// MessageId: STATUS_GRAPHICS_INVALID_PIXELVALUEACCESSMODE
//
// MessageText:
//
// Specified pixel value access mode is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_PIXELVALUEACCESSMODE}
  STATUS_GRAPHICS_INVALID_PIXELVALUEACCESSMODE =  TNTStatus($C01E033F);

//
// MessageId: STATUS_GRAPHICS_TARGET_NOT_IN_TOPOLOGY
//
// MessageText:
//
// Specified target is not part of the specified VidPN's topology.
//
  {$EXTERNALSYM STATUS_GRAPHICS_TARGET_NOT_IN_TOPOLOGY}
  STATUS_GRAPHICS_TARGET_NOT_IN_TOPOLOGY =  TNTStatus($C01E0340);

//
// MessageId: STATUS_GRAPHICS_NO_DISPLAY_MODE_MANAGEMENT_SUPPORT
//
// MessageText:
//
// Failed to acquire display mode management interface.
//
  {$EXTERNALSYM STATUS_GRAPHICS_NO_DISPLAY_MODE_MANAGEMENT_SUPPORT}
  STATUS_GRAPHICS_NO_DISPLAY_MODE_MANAGEMENT_SUPPORT =  TNTStatus($C01E0341);

//
// MessageId: STATUS_GRAPHICS_VIDPN_SOURCE_IN_USE
//
// MessageText:
//
// Specified VidPN source is already owned by a DMM client and cannot be used until that client releases it.
//
  {$EXTERNALSYM STATUS_GRAPHICS_VIDPN_SOURCE_IN_USE}
  STATUS_GRAPHICS_VIDPN_SOURCE_IN_USE =  TNTStatus($C01E0342);

//
// MessageId: STATUS_GRAPHICS_CANT_ACCESS_ACTIVE_VIDPN
//
// MessageText:
//
// Specified VidPN is active and cannot be accessed.
//
  {$EXTERNALSYM STATUS_GRAPHICS_CANT_ACCESS_ACTIVE_VIDPN}
  STATUS_GRAPHICS_CANT_ACCESS_ACTIVE_VIDPN =  TNTStatus($C01E0343);

//
// MessageId: STATUS_GRAPHICS_INVALID_PATH_IMPORTANCE_ORDINAL
//
// MessageText:
//
// Specified VidPN present path importance ordinal is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_PATH_IMPORTANCE_ORDINAL}
  STATUS_GRAPHICS_INVALID_PATH_IMPORTANCE_ORDINAL =  TNTStatus($C01E0344);

//
// MessageId: STATUS_GRAPHICS_INVALID_PATH_CONTENT_GEOMETRY_TRANSFORMATION
//
// MessageText:
//
// Specified VidPN present path content geometry transformation is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_PATH_CONTENT_GEOMETRY_TRANSFORMATION}
  STATUS_GRAPHICS_INVALID_PATH_CONTENT_GEOMETRY_TRANSFORMATION =  TNTStatus($C01E0345);

//
// MessageId: STATUS_GRAPHICS_PATH_CONTENT_GEOMETRY_TRANSFORMATION_NOT_SUPPORTED
//
// MessageText:
//
// Specified content geometry transformation is not supported on the respective VidPN present path.
//
  {$EXTERNALSYM STATUS_GRAPHICS_PATH_CONTENT_GEOMETRY_TRANSFORMATION_NOT_SUPPORTED}
  STATUS_GRAPHICS_PATH_CONTENT_GEOMETRY_TRANSFORMATION_NOT_SUPPORTED =  TNTStatus($C01E0346);

//
// MessageId: STATUS_GRAPHICS_INVALID_GAMMA_RAMP
//
// MessageText:
//
// Specified gamma ramp is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_GAMMA_RAMP}
  STATUS_GRAPHICS_INVALID_GAMMA_RAMP =  TNTStatus($C01E0347);

//
// MessageId: STATUS_GRAPHICS_GAMMA_RAMP_NOT_SUPPORTED
//
// MessageText:
//
// Specified gamma ramp is not supported on the respective VidPN present path.
//
  {$EXTERNALSYM STATUS_GRAPHICS_GAMMA_RAMP_NOT_SUPPORTED}
  STATUS_GRAPHICS_GAMMA_RAMP_NOT_SUPPORTED =  TNTStatus($C01E0348);

//
// MessageId: STATUS_GRAPHICS_MULTISAMPLING_NOT_SUPPORTED
//
// MessageText:
//
// Multi-sampling is not supported on the respective VidPN present path.
//
  {$EXTERNALSYM STATUS_GRAPHICS_MULTISAMPLING_NOT_SUPPORTED}
  STATUS_GRAPHICS_MULTISAMPLING_NOT_SUPPORTED =  TNTStatus($C01E0349);

//
// MessageId: STATUS_GRAPHICS_MODE_NOT_IN_MODESET
//
// MessageText:
//
// Specified mode is not in the specified mode set.
//
  {$EXTERNALSYM STATUS_GRAPHICS_MODE_NOT_IN_MODESET}
  STATUS_GRAPHICS_MODE_NOT_IN_MODESET =  TNTStatus($C01E034A);

//
// MessageId: STATUS_GRAPHICS_DATASET_IS_EMPTY
//
// MessageText:
//
// Specified data set (e.g. mode set, frequency range set, descriptor set, topology, etc.) is empty.
//
  {$EXTERNALSYM STATUS_GRAPHICS_DATASET_IS_EMPTY}
  STATUS_GRAPHICS_DATASET_IS_EMPTY =  TNTStatus($401E034B);

//
// MessageId: STATUS_GRAPHICS_NO_MORE_ELEMENTS_IN_DATASET
//
// MessageText:
//
// Specified data set (e.g. mode set, frequency range set, descriptor set, topology, etc.) does not contain any more elements.
//
  {$EXTERNALSYM STATUS_GRAPHICS_NO_MORE_ELEMENTS_IN_DATASET}
  STATUS_GRAPHICS_NO_MORE_ELEMENTS_IN_DATASET =  TNTStatus($401E034C);

//
// MessageId: STATUS_GRAPHICS_INVALID_VIDPN_TOPOLOGY_RECOMMENDATION_REASON
//
// MessageText:
//
// Specified VidPN topology recommendation reason is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_VIDPN_TOPOLOGY_RECOMMENDATION_REASON}
  STATUS_GRAPHICS_INVALID_VIDPN_TOPOLOGY_RECOMMENDATION_REASON =  TNTStatus($C01E034D);

//
// MessageId: STATUS_GRAPHICS_INVALID_PATH_CONTENT_TYPE
//
// MessageText:
//
// Specified VidPN present path content type is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_PATH_CONTENT_TYPE}
  STATUS_GRAPHICS_INVALID_PATH_CONTENT_TYPE =  TNTStatus($C01E034E);

//
// MessageId: STATUS_GRAPHICS_INVALID_COPYPROTECTION_TYPE
//
// MessageText:
//
// Specified VidPN present path copy protection type is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_COPYPROTECTION_TYPE}
  STATUS_GRAPHICS_INVALID_COPYPROTECTION_TYPE =  TNTStatus($C01E034F);

//
// MessageId: STATUS_GRAPHICS_UNASSIGNED_MODESET_ALREADY_EXISTS
//
// MessageText:
//
// No more than one unassigned mode set can exist at any given time for a given VidPN source/target.
//
  {$EXTERNALSYM STATUS_GRAPHICS_UNASSIGNED_MODESET_ALREADY_EXISTS}
  STATUS_GRAPHICS_UNASSIGNED_MODESET_ALREADY_EXISTS =  TNTStatus($C01E0350);

//
// MessageId: STATUS_GRAPHICS_PATH_CONTENT_GEOMETRY_TRANSFORMATION_NOT_PINNED
//
// MessageText:
//
// Specified content transformation is not pinned on the specified VidPN present path.
//
  {$EXTERNALSYM STATUS_GRAPHICS_PATH_CONTENT_GEOMETRY_TRANSFORMATION_NOT_PINNED}
  STATUS_GRAPHICS_PATH_CONTENT_GEOMETRY_TRANSFORMATION_NOT_PINNED =  TNTStatus($401E0351);

//
// MessageId: STATUS_GRAPHICS_INVALID_SCANLINE_ORDERING
//
// MessageText:
//
// Specified scanline ordering type is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_SCANLINE_ORDERING}
  STATUS_GRAPHICS_INVALID_SCANLINE_ORDERING =  TNTStatus($C01E0352);

//
// MessageId: STATUS_GRAPHICS_TOPOLOGY_CHANGES_NOT_ALLOWED
//
// MessageText:
//
// Topology changes are not allowed for the specified VidPN.
//
  {$EXTERNALSYM STATUS_GRAPHICS_TOPOLOGY_CHANGES_NOT_ALLOWED}
  STATUS_GRAPHICS_TOPOLOGY_CHANGES_NOT_ALLOWED =  TNTStatus($C01E0353);

//
// MessageId: STATUS_GRAPHICS_NO_AVAILABLE_IMPORTANCE_ORDINALS
//
// MessageText:
//
// All available importance ordinals are already used in specified topology.
//
  {$EXTERNALSYM STATUS_GRAPHICS_NO_AVAILABLE_IMPORTANCE_ORDINALS}
  STATUS_GRAPHICS_NO_AVAILABLE_IMPORTANCE_ORDINALS =  TNTStatus($C01E0354);

//
// MessageId: STATUS_GRAPHICS_INCOMPATIBLE_PRIVATE_FORMAT
//
// MessageText:
//
// Specified primary surface has a different private format attribute than the current primary surface
//
  {$EXTERNALSYM STATUS_GRAPHICS_INCOMPATIBLE_PRIVATE_FORMAT}
  STATUS_GRAPHICS_INCOMPATIBLE_PRIVATE_FORMAT =  TNTStatus($C01E0355);

//
// MessageId: STATUS_GRAPHICS_INVALID_MODE_PRUNING_ALGORITHM
//
// MessageText:
//
// Specified mode pruning algorithm is invalid
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_MODE_PRUNING_ALGORITHM}
  STATUS_GRAPHICS_INVALID_MODE_PRUNING_ALGORITHM =  TNTStatus($C01E0356);

//
// MessageId: STATUS_GRAPHICS_INVALID_MONITOR_CAPABILITY_ORIGIN
//
// MessageText:
//
// Specified monitor capability origin is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_MONITOR_CAPABILITY_ORIGIN}
  STATUS_GRAPHICS_INVALID_MONITOR_CAPABILITY_ORIGIN =  TNTStatus($C01E0357);

//
// MessageId: STATUS_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGE_CONSTRAINT
//
// MessageText:
//
// Specified monitor frequency range constraint is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGE_CONSTRAINT}
  STATUS_GRAPHICS_INVALID_MONITOR_FREQUENCYRANGE_CONSTRAINT =  TNTStatus($C01E0358);

//
// MessageId: STATUS_GRAPHICS_MAX_NUM_PATHS_REACHED
//
// MessageText:
//
// Maximum supported number of present paths has been reached.
//
  {$EXTERNALSYM STATUS_GRAPHICS_MAX_NUM_PATHS_REACHED}
  STATUS_GRAPHICS_MAX_NUM_PATHS_REACHED =  TNTStatus($C01E0359);

//
// MessageId: STATUS_GRAPHICS_CANCEL_VIDPN_TOPOLOGY_AUGMENTATION
//
// MessageText:
//
// Miniport requested that augmentation be cancelled for the specified source of the specified VidPN's topology.
//
  {$EXTERNALSYM STATUS_GRAPHICS_CANCEL_VIDPN_TOPOLOGY_AUGMENTATION}
  STATUS_GRAPHICS_CANCEL_VIDPN_TOPOLOGY_AUGMENTATION =  TNTStatus($C01E035A);

//
// MessageId: STATUS_GRAPHICS_INVALID_CLIENT_TYPE
//
// MessageText:
//
// Specified client type was not recognized.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_CLIENT_TYPE}
  STATUS_GRAPHICS_INVALID_CLIENT_TYPE =  TNTStatus($C01E035B);

//
// MessageId: STATUS_GRAPHICS_CLIENTVIDPN_NOT_SET
//
// MessageText:
//
// Client VidPN is not set on this adapter (e.g. no user mode initiated mode changes took place on this adapter yet).
//
  {$EXTERNALSYM STATUS_GRAPHICS_CLIENTVIDPN_NOT_SET}
  STATUS_GRAPHICS_CLIENTVIDPN_NOT_SET =  TNTStatus($C01E035C);

//
//   Port specific status codes {0x0400..0x04ff}
//
//
// MessageId: STATUS_GRAPHICS_SPECIFIED_CHILD_ALREADY_CONNECTED
//
// MessageText:
//
// Specified display adapter child device already has an external device connected to it.
//
  {$EXTERNALSYM STATUS_GRAPHICS_SPECIFIED_CHILD_ALREADY_CONNECTED}
  STATUS_GRAPHICS_SPECIFIED_CHILD_ALREADY_CONNECTED =  TNTStatus($C01E0400);

//
// MessageId: STATUS_GRAPHICS_CHILD_DESCRIPTOR_NOT_SUPPORTED
//
// MessageText:
//
// Specified display adapter child device does not support descriptor exposure.
//
  {$EXTERNALSYM STATUS_GRAPHICS_CHILD_DESCRIPTOR_NOT_SUPPORTED}
  STATUS_GRAPHICS_CHILD_DESCRIPTOR_NOT_SUPPORTED =  TNTStatus($C01E0401);

//
// MessageId: STATUS_GRAPHICS_UNKNOWN_CHILD_STATUS
//
// MessageText:
//
// Child device presence was not reliably detected.
//
  {$EXTERNALSYM STATUS_GRAPHICS_UNKNOWN_CHILD_STATUS}
  STATUS_GRAPHICS_UNKNOWN_CHILD_STATUS =  TNTStatus($401E042F);

//
// MessageId: STATUS_GRAPHICS_NOT_A_LINKED_ADAPTER
//
// MessageText:
//
// The display adapter is not linked to any other adapters.
//
  {$EXTERNALSYM STATUS_GRAPHICS_NOT_A_LINKED_ADAPTER}
  STATUS_GRAPHICS_NOT_A_LINKED_ADAPTER =  TNTStatus($C01E0430);

//
// MessageId: STATUS_GRAPHICS_LEADLINK_NOT_ENUMERATED
//
// MessageText:
//
// Lead adapter in a linked configuration was not enumerated yet.
//
  {$EXTERNALSYM STATUS_GRAPHICS_LEADLINK_NOT_ENUMERATED}
  STATUS_GRAPHICS_LEADLINK_NOT_ENUMERATED =  TNTStatus($C01E0431);

//
// MessageId: STATUS_GRAPHICS_CHAINLINKS_NOT_ENUMERATED
//
// MessageText:
//
// Some chain adapters in a linked configuration were not enumerated yet.
//
  {$EXTERNALSYM STATUS_GRAPHICS_CHAINLINKS_NOT_ENUMERATED}
  STATUS_GRAPHICS_CHAINLINKS_NOT_ENUMERATED =  TNTStatus($C01E0432);

//
// MessageId: STATUS_GRAPHICS_ADAPTER_CHAIN_NOT_READY
//
// MessageText:
//
// The chain of linked adapters is not ready to start because of an unknown failure.
//
  {$EXTERNALSYM STATUS_GRAPHICS_ADAPTER_CHAIN_NOT_READY}
  STATUS_GRAPHICS_ADAPTER_CHAIN_NOT_READY =  TNTStatus($C01E0433);

//
// MessageId: STATUS_GRAPHICS_CHAINLINKS_NOT_STARTED
//
// MessageText:
//
// An attempt was made to start a lead link display adapter when the chain links were not started yet.
//
  {$EXTERNALSYM STATUS_GRAPHICS_CHAINLINKS_NOT_STARTED}
  STATUS_GRAPHICS_CHAINLINKS_NOT_STARTED =  TNTStatus($C01E0434);

//
// MessageId: STATUS_GRAPHICS_CHAINLINKS_NOT_POWERED_ON
//
// MessageText:
//
// An attempt was made to power up a lead link display adapter when the chain links were powered down.
//
  {$EXTERNALSYM STATUS_GRAPHICS_CHAINLINKS_NOT_POWERED_ON}
  STATUS_GRAPHICS_CHAINLINKS_NOT_POWERED_ON =  TNTStatus($C01E0435);

//
// MessageId: STATUS_GRAPHICS_INCONSISTENT_DEVICE_LINK_STATE
//
// MessageText:
//
// The adapter link was found to be in an inconsistent state. Not all adapters are in an expected PNP/Power state.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INCONSISTENT_DEVICE_LINK_STATE}
  STATUS_GRAPHICS_INCONSISTENT_DEVICE_LINK_STATE =  TNTStatus($C01E0436);

//
// MessageId: STATUS_GRAPHICS_LEADLINK_START_DEFERRED
//
// MessageText:
//
// Starting the leadlink adapter has been deferred temporarily.
//
  {$EXTERNALSYM STATUS_GRAPHICS_LEADLINK_START_DEFERRED}
  STATUS_GRAPHICS_LEADLINK_START_DEFERRED =  TNTStatus($401E0437);

//
// MessageId: STATUS_GRAPHICS_NOT_POST_DEVICE_DRIVER
//
// MessageText:
//
// The driver trying to start is not the same as the driver for the POSTed display adapter.
//
  {$EXTERNALSYM STATUS_GRAPHICS_NOT_POST_DEVICE_DRIVER}
  STATUS_GRAPHICS_NOT_POST_DEVICE_DRIVER =  TNTStatus($C01E0438);

//
// MessageId: STATUS_GRAPHICS_POLLING_TOO_FREQUENTLY
//
// MessageText:
//
// The display adapter is being polled for children too frequently at the same polling level.
//
  {$EXTERNALSYM STATUS_GRAPHICS_POLLING_TOO_FREQUENTLY}
  STATUS_GRAPHICS_POLLING_TOO_FREQUENTLY =  TNTStatus($401E0439);

//
// MessageId: STATUS_GRAPHICS_START_DEFERRED
//
// MessageText:
//
// Starting the adapter has been deferred temporarily.
//
  {$EXTERNALSYM STATUS_GRAPHICS_START_DEFERRED}
  STATUS_GRAPHICS_START_DEFERRED   =  TNTStatus($401E043A);

//
// MessageId: STATUS_GRAPHICS_ADAPTER_ACCESS_NOT_EXCLUDED
//
// MessageText:
//
// An operation is being attempted that requires the display adapter to be in a quiescent state.
//
  {$EXTERNALSYM STATUS_GRAPHICS_ADAPTER_ACCESS_NOT_EXCLUDED}
  STATUS_GRAPHICS_ADAPTER_ACCESS_NOT_EXCLUDED =  TNTStatus($C01E043B);

//
//   OPM, PVP and UAB status codes {0x0500..0x057F}
//
//
// MessageId: STATUS_GRAPHICS_OPM_NOT_SUPPORTED
//
// MessageText:
//
// The driver does not support OPM.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_NOT_SUPPORTED}
  STATUS_GRAPHICS_OPM_NOT_SUPPORTED =  TNTStatus($C01E0500);

//
// MessageId: STATUS_GRAPHICS_COPP_NOT_SUPPORTED
//
// MessageText:
//
// The driver does not support COPP.
//
  {$EXTERNALSYM STATUS_GRAPHICS_COPP_NOT_SUPPORTED}
  STATUS_GRAPHICS_COPP_NOT_SUPPORTED =  TNTStatus($C01E0501);

//
// MessageId: STATUS_GRAPHICS_UAB_NOT_SUPPORTED
//
// MessageText:
//
// The driver does not support UAB.
//
  {$EXTERNALSYM STATUS_GRAPHICS_UAB_NOT_SUPPORTED}
  STATUS_GRAPHICS_UAB_NOT_SUPPORTED =  TNTStatus($C01E0502);

//
// MessageId: STATUS_GRAPHICS_OPM_INVALID_ENCRYPTED_PARAMETERS
//
// MessageText:
//
// The specified encrypted parameters are invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_INVALID_ENCRYPTED_PARAMETERS}
  STATUS_GRAPHICS_OPM_INVALID_ENCRYPTED_PARAMETERS =  TNTStatus($C01E0503);

//
// MessageId: STATUS_GRAPHICS_OPM_NO_PROTECTED_OUTPUTS_EXIST
//
// MessageText:
//
// The GDI display device passed to this function does not have any active protected outputs.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_NO_PROTECTED_OUTPUTS_EXIST}
  STATUS_GRAPHICS_OPM_NO_PROTECTED_OUTPUTS_EXIST =  TNTStatus($C01E0505);

//
// MessageId: STATUS_GRAPHICS_OPM_INTERNAL_ERROR
//
// MessageText:
//
// An internal error caused an operation to fail.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_INTERNAL_ERROR}
  STATUS_GRAPHICS_OPM_INTERNAL_ERROR =  TNTStatus($C01E050B);

//
// MessageId: STATUS_GRAPHICS_OPM_INVALID_HANDLE
//
// MessageText:
//
// The function failed because the caller passed in an invalid OPM user mode handle.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_INVALID_HANDLE}
  STATUS_GRAPHICS_OPM_INVALID_HANDLE =  TNTStatus($C01E050C);

//
// MessageId: STATUS_GRAPHICS_PVP_INVALID_CERTIFICATE_LENGTH
//
// MessageText:
//
// A certificate could not be returned because the certificate buffer passed to the function was too small.
//
  {$EXTERNALSYM STATUS_GRAPHICS_PVP_INVALID_CERTIFICATE_LENGTH}
  STATUS_GRAPHICS_PVP_INVALID_CERTIFICATE_LENGTH =  TNTStatus($C01E050E);

//
// MessageId: STATUS_GRAPHICS_OPM_SPANNING_MODE_ENABLED
//
// MessageText:
//
// The DxgkDdiOpmCreateProtectedOutput function could not create a protected output because the Video Present Target is in spanning mode.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_SPANNING_MODE_ENABLED}
  STATUS_GRAPHICS_OPM_SPANNING_MODE_ENABLED =  TNTStatus($C01E050F);

//
// MessageId: STATUS_GRAPHICS_OPM_THEATER_MODE_ENABLED
//
// MessageText:
//
// The DxgkDdiOpmCreateProtectedOutput function could not create a protected output because the Video Present Target is in theater mode.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_THEATER_MODE_ENABLED}
  STATUS_GRAPHICS_OPM_THEATER_MODE_ENABLED =  TNTStatus($C01E0510);

//
// MessageId: STATUS_GRAPHICS_PVP_HFS_FAILED
//
// MessageText:
//
// The function failed because the display adapter's Hardware Functionality Scan failed to validate the graphics hardware.  
//
  {$EXTERNALSYM STATUS_GRAPHICS_PVP_HFS_FAILED}
  STATUS_GRAPHICS_PVP_HFS_FAILED   =  TNTStatus($C01E0511);

//
// MessageId: STATUS_GRAPHICS_OPM_INVALID_SRM
//
// MessageText:
//
// The HDCP System Renewability Message passed to this function did not comply with section 5 of the HDCP 1.1 specification.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_INVALID_SRM}
  STATUS_GRAPHICS_OPM_INVALID_SRM  =  TNTStatus($C01E0512);

//
// MessageId: STATUS_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_HDCP
//
// MessageText:
//
// The protected output cannot enable the High-bandwidth Digital Content Protection (HDCP) System because it does not support HDCP.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_HDCP}
  STATUS_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_HDCP =  TNTStatus($C01E0513);

//
// MessageId: STATUS_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_ACP
//
// MessageText:
//
// The protected output cannot enable Analogue Copy Protection (ACP) because it does not support ACP.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_ACP}
  STATUS_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_ACP =  TNTStatus($C01E0514);

//
// MessageId: STATUS_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_CGMSA
//
// MessageText:
//
// The protected output cannot enable the Content Generation Management System Analogue (CGMS-A) protection technology because it does not support CGMS-A.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_CGMSA}
  STATUS_GRAPHICS_OPM_OUTPUT_DOES_NOT_SUPPORT_CGMSA =  TNTStatus($C01E0515);

//
// MessageId: STATUS_GRAPHICS_OPM_HDCP_SRM_NEVER_SET
//
// MessageText:
//
// The DxgkDdiOPMGetInformation function cannot return the version of the SRM being used because the application never successfully passed an SRM to the protected output.  
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_HDCP_SRM_NEVER_SET}
  STATUS_GRAPHICS_OPM_HDCP_SRM_NEVER_SET =  TNTStatus($C01E0516);

//
// MessageId: STATUS_GRAPHICS_OPM_RESOLUTION_TOO_HIGH
//
// MessageText:
//
// The DxgkDdiOPMConfigureProtectedOutput function cannot enable the specified output protection technology because the output's screen resolution is too high.  
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_RESOLUTION_TOO_HIGH}
  STATUS_GRAPHICS_OPM_RESOLUTION_TOO_HIGH =  TNTStatus($C01E0517);

//
// MessageId: STATUS_GRAPHICS_OPM_ALL_HDCP_HARDWARE_ALREADY_IN_USE
//
// MessageText:
//
// The DxgkDdiOPMConfigureProtectedOutput function cannot enable HDCP because the display adapter's HDCP hardware is already being used by other physical outputs.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_ALL_HDCP_HARDWARE_ALREADY_IN_USE}
  STATUS_GRAPHICS_OPM_ALL_HDCP_HARDWARE_ALREADY_IN_USE =  TNTStatus($C01E0518);

//
// MessageId: STATUS_GRAPHICS_OPM_PROTECTED_OUTPUT_NO_LONGER_EXISTS
//
// MessageText:
//
// The operating system asynchronously destroyed this OPM protected output because the operating system's state changed.  This error typically occurs because the monitor PDO associated with this protected output was removed, the monitor PDO associated with this protected output was stopped, or the protected output's session became a non-console session.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_PROTECTED_OUTPUT_NO_LONGER_EXISTS}
  STATUS_GRAPHICS_OPM_PROTECTED_OUTPUT_NO_LONGER_EXISTS =  TNTStatus($C01E051A);

//
// MessageId: STATUS_GRAPHICS_OPM_PROTECTED_OUTPUT_DOES_NOT_HAVE_COPP_SEMANTICS
//
// MessageText:
//
// Either the DxgkDdiOPMGetCOPPCompatibleInformation, DxgkDdiOPMGetInformation, or DxgkDdiOPMConfigureProtectedOutput function failed.  This error is only returned if a protected output has OPM semantics.  DxgkDdiOPMGetCOPPCompatibleInformation always returns this error if a protected output has OPM semantics.  DxgkDdiOPMGetInformation returns this error code if the caller requested COPP specific information.  DxgkDdiOPMConfigureProtectedOutput returns this error when the caller tries to use a COPP specific command.  
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_PROTECTED_OUTPUT_DOES_NOT_HAVE_COPP_SEMANTICS}
  STATUS_GRAPHICS_OPM_PROTECTED_OUTPUT_DOES_NOT_HAVE_COPP_SEMANTICS =  TNTStatus($C01E051C);

//
// MessageId: STATUS_GRAPHICS_OPM_INVALID_INFORMATION_REQUEST
//
// MessageText:
//
// The DxgkDdiOPMGetInformation and DxgkDdiOPMGetCOPPCompatibleInformation functions return this error code if the passed in sequence number is not the expected sequence number or the passed in OMAC value is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_INVALID_INFORMATION_REQUEST}
  STATUS_GRAPHICS_OPM_INVALID_INFORMATION_REQUEST =  TNTStatus($C01E051D);

//
// MessageId: STATUS_GRAPHICS_OPM_DRIVER_INTERNAL_ERROR
//
// MessageText:
//
// The function failed because an unexpected error occurred inside of a display driver.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_DRIVER_INTERNAL_ERROR}
  STATUS_GRAPHICS_OPM_DRIVER_INTERNAL_ERROR =  TNTStatus($C01E051E);

//
// MessageId: STATUS_GRAPHICS_OPM_PROTECTED_OUTPUT_DOES_NOT_HAVE_OPM_SEMANTICS
//
// MessageText:
//
// Either the DxgkDdiOPMGetCOPPCompatibleInformation, DxgkDdiOPMGetInformation, or DxgkDdiOPMConfigureProtectedOutput function failed.  This error is only returned if a protected output has COPP semantics.  DxgkDdiOPMGetCOPPCompatibleInformation returns this error code if the caller requested OPM specific information.  DxgkDdiOPMGetInformation always returns this error if a protected output has COPP semantics.  DxgkDdiOPMConfigureProtectedOutput returns this error when the caller tries to use an OPM specific command.  
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_PROTECTED_OUTPUT_DOES_NOT_HAVE_OPM_SEMANTICS}
  STATUS_GRAPHICS_OPM_PROTECTED_OUTPUT_DOES_NOT_HAVE_OPM_SEMANTICS =  TNTStatus($C01E051F);

//
// MessageId: STATUS_GRAPHICS_OPM_SIGNALING_NOT_SUPPORTED
//
// MessageText:
//
// The DxgkDdiOPMGetCOPPCompatibleInformation and DxgkDdiOPMConfigureProtectedOutput functions return this error if the display driver does not support the DXGKMDT_OPM_GET_ACP_AND_CGMSA_SIGNALING and DXGKMDT_OPM_SET_ACP_AND_CGMSA_SIGNALING GUIDs.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_SIGNALING_NOT_SUPPORTED}
  STATUS_GRAPHICS_OPM_SIGNALING_NOT_SUPPORTED =  TNTStatus($C01E0520);

//
// MessageId: STATUS_GRAPHICS_OPM_INVALID_CONFIGURATION_REQUEST
//
// MessageText:
//
// The DxgkDdiOPMConfigureProtectedOutput function returns this error code if the passed in sequence number is not the expected sequence number or the passed in OMAC value is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_OPM_INVALID_CONFIGURATION_REQUEST}
  STATUS_GRAPHICS_OPM_INVALID_CONFIGURATION_REQUEST =  TNTStatus($C01E0521);

//
//   Monitor Configuration API status codes {0x0580..0x05DF}
//
//
// MessageId: STATUS_GRAPHICS_I2C_NOT_SUPPORTED
//
// MessageText:
//
// The monitor connected to the specified video output does not have an I2C bus.
//
  {$EXTERNALSYM STATUS_GRAPHICS_I2C_NOT_SUPPORTED}
  STATUS_GRAPHICS_I2C_NOT_SUPPORTED =  TNTStatus($C01E0580);

//
// MessageId: STATUS_GRAPHICS_I2C_DEVICE_DOES_NOT_EXIST
//
// MessageText:
//
// No device on the I2C bus has the specified address.
//
  {$EXTERNALSYM STATUS_GRAPHICS_I2C_DEVICE_DOES_NOT_EXIST}
  STATUS_GRAPHICS_I2C_DEVICE_DOES_NOT_EXIST =  TNTStatus($C01E0581);

//
// MessageId: STATUS_GRAPHICS_I2C_ERROR_TRANSMITTING_DATA
//
// MessageText:
//
// An error occurred while transmitting data to the device on the I2C bus.
//
  {$EXTERNALSYM STATUS_GRAPHICS_I2C_ERROR_TRANSMITTING_DATA}
  STATUS_GRAPHICS_I2C_ERROR_TRANSMITTING_DATA =  TNTStatus($C01E0582);

//
// MessageId: STATUS_GRAPHICS_I2C_ERROR_RECEIVING_DATA
//
// MessageText:
//
// An error occurred while receiving data from the device on the I2C bus.
//
  {$EXTERNALSYM STATUS_GRAPHICS_I2C_ERROR_RECEIVING_DATA}
  STATUS_GRAPHICS_I2C_ERROR_RECEIVING_DATA =  TNTStatus($C01E0583);

//
// MessageId: STATUS_GRAPHICS_DDCCI_VCP_NOT_SUPPORTED
//
// MessageText:
//
// The monitor does not support the specified VCP code.
//
  {$EXTERNALSYM STATUS_GRAPHICS_DDCCI_VCP_NOT_SUPPORTED}
  STATUS_GRAPHICS_DDCCI_VCP_NOT_SUPPORTED =  TNTStatus($C01E0584);

//
// MessageId: STATUS_GRAPHICS_DDCCI_INVALID_DATA
//
// MessageText:
//
// The data received from the monitor is invalid.
//
  {$EXTERNALSYM STATUS_GRAPHICS_DDCCI_INVALID_DATA}
  STATUS_GRAPHICS_DDCCI_INVALID_DATA =  TNTStatus($C01E0585);

//
// MessageId: STATUS_GRAPHICS_DDCCI_MONITOR_RETURNED_INVALID_TIMING_STATUS_BYTE
//
// MessageText:
//
// The function failed because a monitor returned an invalid Timing Status byte when the operating system used the DDC/CI Get Timing Report & Timing Message command to get a timing report from a monitor.
//
  {$EXTERNALSYM STATUS_GRAPHICS_DDCCI_MONITOR_RETURNED_INVALID_TIMING_STATUS_BYTE}
  STATUS_GRAPHICS_DDCCI_MONITOR_RETURNED_INVALID_TIMING_STATUS_BYTE =  TNTStatus($C01E0586);

//
// MessageId: STATUS_GRAPHICS_DDCCI_INVALID_CAPABILITIES_STRING
//
// MessageText:
//
// A monitor returned a DDC/CI capabilities string which did not comply with the ACCESS.bus 3.0, DDC/CI 1.1, or MCCS 2 Revision 1 specification.
//
  {$EXTERNALSYM STATUS_GRAPHICS_DDCCI_INVALID_CAPABILITIES_STRING}
  STATUS_GRAPHICS_DDCCI_INVALID_CAPABILITIES_STRING =  TNTStatus($C01E0587);

//
// MessageId: STATUS_GRAPHICS_MCA_INTERNAL_ERROR
//
// MessageText:
//
// An internal error caused an operation to fail.
//
  {$EXTERNALSYM STATUS_GRAPHICS_MCA_INTERNAL_ERROR}
  STATUS_GRAPHICS_MCA_INTERNAL_ERROR =  TNTStatus($C01E0588);

//
// MessageId: STATUS_GRAPHICS_DDCCI_INVALID_MESSAGE_COMMAND
//
// MessageText:
//
// An operation failed because a DDC/CI message had an invalid value in its command field.
//
  {$EXTERNALSYM STATUS_GRAPHICS_DDCCI_INVALID_MESSAGE_COMMAND}
  STATUS_GRAPHICS_DDCCI_INVALID_MESSAGE_COMMAND =  TNTStatus($C01E0589);

//
// MessageId: STATUS_GRAPHICS_DDCCI_INVALID_MESSAGE_LENGTH
//
// MessageText:
//
// An error occurred because the field length of a DDC/CI message contained an invalid value.  
//
  {$EXTERNALSYM STATUS_GRAPHICS_DDCCI_INVALID_MESSAGE_LENGTH}
  STATUS_GRAPHICS_DDCCI_INVALID_MESSAGE_LENGTH =  TNTStatus($C01E058A);

//
// MessageId: STATUS_GRAPHICS_DDCCI_INVALID_MESSAGE_CHECKSUM
//
// MessageText:
//
// An error occurred because the checksum field in a DDC/CI message did not match the message's computed checksum value.  This error implies that the data was corrupted while it was being transmitted from a monitor to a computer.
//
  {$EXTERNALSYM STATUS_GRAPHICS_DDCCI_INVALID_MESSAGE_CHECKSUM}
  STATUS_GRAPHICS_DDCCI_INVALID_MESSAGE_CHECKSUM =  TNTStatus($C01E058B);

//
// MessageId: STATUS_GRAPHICS_INVALID_PHYSICAL_MONITOR_HANDLE
//
// MessageText:
//
// This function failed because an invalid monitor handle was passed to it.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_PHYSICAL_MONITOR_HANDLE}
  STATUS_GRAPHICS_INVALID_PHYSICAL_MONITOR_HANDLE =  TNTStatus($C01E058C);

//
// MessageId: STATUS_GRAPHICS_MONITOR_NO_LONGER_EXISTS
//
// MessageText:
//
// The operating system asynchronously destroyed the monitor which corresponds to this handle because the operating system's state changed.  This error typically occurs because the monitor PDO associated with this handle was removed, the monitor PDO associated with this handle was stopped, or a display mode change occurred.  A display mode change occurs when windows sends a WM_DISPLAYCHANGE windows message to applications.
//
  {$EXTERNALSYM STATUS_GRAPHICS_MONITOR_NO_LONGER_EXISTS}
  STATUS_GRAPHICS_MONITOR_NO_LONGER_EXISTS =  TNTStatus($C01E058D);

//
//   OPM, UAB, PVP and DDC/CI shared status codes {0x25E0..0x25FF}
//
//
// MessageId: STATUS_GRAPHICS_ONLY_CONSOLE_SESSION_SUPPORTED
//
// MessageText:
//
// This function can only be used if a program is running in the local console session.  It cannot be used if a program is running on a remote desktop session or on a terminal server session.
//
  {$EXTERNALSYM STATUS_GRAPHICS_ONLY_CONSOLE_SESSION_SUPPORTED}
  STATUS_GRAPHICS_ONLY_CONSOLE_SESSION_SUPPORTED =  TNTStatus($C01E05E0);

//
// MessageId: STATUS_GRAPHICS_NO_DISPLAY_DEVICE_CORRESPONDS_TO_NAME
//
// MessageText:
//
// This function cannot find an actual GDI display device which corresponds to the specified GDI display device name.
//
  {$EXTERNALSYM STATUS_GRAPHICS_NO_DISPLAY_DEVICE_CORRESPONDS_TO_NAME}
  STATUS_GRAPHICS_NO_DISPLAY_DEVICE_CORRESPONDS_TO_NAME =  TNTStatus($C01E05E1);

//
// MessageId: STATUS_GRAPHICS_DISPLAY_DEVICE_NOT_ATTACHED_TO_DESKTOP
//
// MessageText:
//
// The function failed because the specified GDI display device was not attached to the Windows desktop.
//
  {$EXTERNALSYM STATUS_GRAPHICS_DISPLAY_DEVICE_NOT_ATTACHED_TO_DESKTOP}
  STATUS_GRAPHICS_DISPLAY_DEVICE_NOT_ATTACHED_TO_DESKTOP =  TNTStatus($C01E05E2);

//
// MessageId: STATUS_GRAPHICS_MIRRORING_DEVICES_NOT_SUPPORTED
//
// MessageText:
//
// This function does not support GDI mirroring display devices because GDI mirroring display devices do not have any physical monitors associated with them.
//
  {$EXTERNALSYM STATUS_GRAPHICS_MIRRORING_DEVICES_NOT_SUPPORTED}
  STATUS_GRAPHICS_MIRRORING_DEVICES_NOT_SUPPORTED =  TNTStatus($C01E05E3);

//
// MessageId: STATUS_GRAPHICS_INVALID_POINTER
//
// MessageText:
//
// The function failed because an invalid pointer parameter was passed to it.  A pointer parameter is invalid if it is NULL, it points to an invalid address, it points to a kernel mode address or it is not correctly aligned.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INVALID_POINTER}
  STATUS_GRAPHICS_INVALID_POINTER  =  TNTStatus($C01E05E4);

//
// MessageId: STATUS_GRAPHICS_NO_MONITORS_CORRESPOND_TO_DISPLAY_DEVICE
//
// MessageText:
//
// This function failed because the GDI device passed to it did not have any monitors associated with it.
//
  {$EXTERNALSYM STATUS_GRAPHICS_NO_MONITORS_CORRESPOND_TO_DISPLAY_DEVICE}
  STATUS_GRAPHICS_NO_MONITORS_CORRESPOND_TO_DISPLAY_DEVICE =  TNTStatus($C01E05E5);

//
// MessageId: STATUS_GRAPHICS_PARAMETER_ARRAY_TOO_SMALL
//
// MessageText:
//
// An array passed to the function cannot hold all of the data that the function must copy into the array.
//
  {$EXTERNALSYM STATUS_GRAPHICS_PARAMETER_ARRAY_TOO_SMALL}
  STATUS_GRAPHICS_PARAMETER_ARRAY_TOO_SMALL =  TNTStatus($C01E05E6);

//
// MessageId: STATUS_GRAPHICS_INTERNAL_ERROR
//
// MessageText:
//
// An internal error caused an operation to fail.
//
  {$EXTERNALSYM STATUS_GRAPHICS_INTERNAL_ERROR}
  STATUS_GRAPHICS_INTERNAL_ERROR   =  TNTStatus($C01E05E7);

//
// MessageId: STATUS_GRAPHICS_SESSION_TYPE_CHANGE_IN_PROGRESS
//
// MessageText:
//
// The function failed because the current session is changing its type.  This function cannot be called when the current session is changing its type.  There are currently three types of sessions: console, disconnected and remote (RDP or ICA).
//
  {$EXTERNALSYM STATUS_GRAPHICS_SESSION_TYPE_CHANGE_IN_PROGRESS}
  STATUS_GRAPHICS_SESSION_TYPE_CHANGE_IN_PROGRESS =  TNTStatus($C01E05E8);


//
// Full Volume Encryption Error codes (fvevol.sys)
//

//
// MessageId: STATUS_FVE_LOCKED_VOLUME
//
// MessageText:
//
// This volume is locked by BitLocker Drive Encryption.
//
  {$EXTERNALSYM STATUS_FVE_LOCKED_VOLUME}
  STATUS_FVE_LOCKED_VOLUME         =  TNTStatus($C0210000);

//
// MessageId: STATUS_FVE_NOT_ENCRYPTED
//
// MessageText:
//
// The volume is not encrypted, no key is available.
//
  {$EXTERNALSYM STATUS_FVE_NOT_ENCRYPTED}
  STATUS_FVE_NOT_ENCRYPTED         =  TNTStatus($C0210001);

//
// MessageId: STATUS_FVE_BAD_INFORMATION
//
// MessageText:
//
// The control block for the encrypted volume is not valid.
//
  {$EXTERNALSYM STATUS_FVE_BAD_INFORMATION}
  STATUS_FVE_BAD_INFORMATION       =  TNTStatus($C0210002);

//
// MessageId: STATUS_FVE_TOO_SMALL
//
// MessageText:
//
// The volume cannot be encrypted because it does not have enough free space.
//
  {$EXTERNALSYM STATUS_FVE_TOO_SMALL}
  STATUS_FVE_TOO_SMALL             =  TNTStatus($C0210003);

//
// MessageId: STATUS_FVE_FAILED_WRONG_FS
//
// MessageText:
//
// The volume cannot be encrypted because the file system is not supported.
//
  {$EXTERNALSYM STATUS_FVE_FAILED_WRONG_FS}
  STATUS_FVE_FAILED_WRONG_FS       =  TNTStatus($C0210004);

//
// MessageId: STATUS_FVE_FAILED_BAD_FS
//
// MessageText:
//
// The file system is corrupt. Run CHKDSK.
//
  {$EXTERNALSYM STATUS_FVE_FAILED_BAD_FS}
  STATUS_FVE_FAILED_BAD_FS         =  TNTStatus($C0210005);

//
// MessageId: STATUS_FVE_FS_NOT_EXTENDED
//
// MessageText:
//
// The file system does not extend to the end of the volume.
//
  {$EXTERNALSYM STATUS_FVE_FS_NOT_EXTENDED}
  STATUS_FVE_FS_NOT_EXTENDED       =  TNTStatus($C0210006);

//
// MessageId: STATUS_FVE_FS_MOUNTED
//
// MessageText:
//
// This operation cannot be performed while a file system is mounted on the volume.
//
  {$EXTERNALSYM STATUS_FVE_FS_MOUNTED}
  STATUS_FVE_FS_MOUNTED            =  TNTStatus($C0210007);

//
// MessageId: STATUS_FVE_NO_LICENSE
//
// MessageText:
//
// BitLocker Drive Encryption is not included with this version of Windows.
//
  {$EXTERNALSYM STATUS_FVE_NO_LICENSE}
  STATUS_FVE_NO_LICENSE            =  TNTStatus($C0210008);

//
// MessageId: STATUS_FVE_ACTION_NOT_ALLOWED
//
// MessageText:
//
// Requested action not allowed in the current volume state.
//
  {$EXTERNALSYM STATUS_FVE_ACTION_NOT_ALLOWED}
  STATUS_FVE_ACTION_NOT_ALLOWED    =  TNTStatus($C0210009);

//
// MessageId: STATUS_FVE_BAD_DATA
//
// MessageText:
//
// Data supplied is malformed.
//
  {$EXTERNALSYM STATUS_FVE_BAD_DATA}
  STATUS_FVE_BAD_DATA              =  TNTStatus($C021000A);

//
// MessageId: STATUS_FVE_VOLUME_NOT_BOUND
//
// MessageText:
//
// The volume is not bound to the system.
//
  {$EXTERNALSYM STATUS_FVE_VOLUME_NOT_BOUND}
  STATUS_FVE_VOLUME_NOT_BOUND      =  TNTStatus($C021000B);

//
// MessageId: STATUS_FVE_NOT_DATA_VOLUME
//
// MessageText:
//
// That volume is not a data volume.
//
  {$EXTERNALSYM STATUS_FVE_NOT_DATA_VOLUME}
  STATUS_FVE_NOT_DATA_VOLUME       =  TNTStatus($C021000C);

//
// MessageId: STATUS_FVE_CONV_READ_ERROR
//
// MessageText:
//
// A read operation failed while converting the volume.
//
  {$EXTERNALSYM STATUS_FVE_CONV_READ_ERROR}
  STATUS_FVE_CONV_READ_ERROR       =  TNTStatus($C021000D);

//
// MessageId: STATUS_FVE_CONV_WRITE_ERROR
//
// MessageText:
//
// A write operation failed while converting the volume.
//
  {$EXTERNALSYM STATUS_FVE_CONV_WRITE_ERROR}
  STATUS_FVE_CONV_WRITE_ERROR      =  TNTStatus($C021000E);

//
// MessageId: STATUS_FVE_OVERLAPPED_UPDATE
//
// MessageText:
//
// The control block for the encrypted volume was updated by another thread. Try again.
//
  {$EXTERNALSYM STATUS_FVE_OVERLAPPED_UPDATE}
  STATUS_FVE_OVERLAPPED_UPDATE     =  TNTStatus($C021000F);

//
// MessageId: STATUS_FVE_FAILED_SECTOR_SIZE
//
// MessageText:
//
// The encryption algorithm does not support the sector size of that volume.
//
  {$EXTERNALSYM STATUS_FVE_FAILED_SECTOR_SIZE}
  STATUS_FVE_FAILED_SECTOR_SIZE    =  TNTStatus($C0210010);

//
// MessageId: STATUS_FVE_FAILED_AUTHENTICATION
//
// MessageText:
//
// BitLocker recovery authentication failed.
//
  {$EXTERNALSYM STATUS_FVE_FAILED_AUTHENTICATION}
  STATUS_FVE_FAILED_AUTHENTICATION =  TNTStatus($C0210011);

//
// MessageId: STATUS_FVE_NOT_OS_VOLUME
//
// MessageText:
//
// That volume is not the OS volume.
//
  {$EXTERNALSYM STATUS_FVE_NOT_OS_VOLUME}
  STATUS_FVE_NOT_OS_VOLUME         =  TNTStatus($C0210012);

//
// MessageId: STATUS_FVE_KEYFILE_NOT_FOUND
//
// MessageText:
//
// The BitLocker startup key or recovery password could not be read from external media.
//
  {$EXTERNALSYM STATUS_FVE_KEYFILE_NOT_FOUND}
  STATUS_FVE_KEYFILE_NOT_FOUND     =  TNTStatus($C0210013);

//
// MessageId: STATUS_FVE_KEYFILE_INVALID
//
// MessageText:
//
// The BitLocker startup key or recovery password file is corrupt or invalid.
//
  {$EXTERNALSYM STATUS_FVE_KEYFILE_INVALID}
  STATUS_FVE_KEYFILE_INVALID       =  TNTStatus($C0210014);

//
// MessageId: STATUS_FVE_KEYFILE_NO_VMK
//
// MessageText:
//
// The BitLocker encryption key could not be obtained from the startup key or recovery password.
//
  {$EXTERNALSYM STATUS_FVE_KEYFILE_NO_VMK}
  STATUS_FVE_KEYFILE_NO_VMK        =  TNTStatus($C0210015);

//
// MessageId: STATUS_FVE_TPM_DISABLED
//
// MessageText:
//
// The Trusted Platform Module (TPM) is disabled.
//
  {$EXTERNALSYM STATUS_FVE_TPM_DISABLED}
  STATUS_FVE_TPM_DISABLED          =  TNTStatus($C0210016);

//
// MessageId: STATUS_FVE_TPM_SRK_AUTH_NOT_ZERO
//
// MessageText:
//
// The authorization data for the Storage Root Key (SRK) of the Trusted Platform Module (TPM) is not zero.
//
  {$EXTERNALSYM STATUS_FVE_TPM_SRK_AUTH_NOT_ZERO}
  STATUS_FVE_TPM_SRK_AUTH_NOT_ZERO =  TNTStatus($C0210017);

//
// MessageId: STATUS_FVE_TPM_INVALID_PCR
//
// MessageText:
//
// The system boot information changed or the Trusted Platform Module (TPM) locked out access to BitLocker encryption keys until the computer is restarted.
//
  {$EXTERNALSYM STATUS_FVE_TPM_INVALID_PCR}
  STATUS_FVE_TPM_INVALID_PCR       =  TNTStatus($C0210018);

//
// MessageId: STATUS_FVE_TPM_NO_VMK
//
// MessageText:
//
// The BitLocker encryption key could not be obtained from the Trusted Platform Module (TPM).
//
  {$EXTERNALSYM STATUS_FVE_TPM_NO_VMK}
  STATUS_FVE_TPM_NO_VMK            =  TNTStatus($C0210019);

//
// MessageId: STATUS_FVE_PIN_INVALID
//
// MessageText:
//
// The BitLocker encryption key could not be obtained from the Trusted Platform Module (TPM) and PIN.
//
  {$EXTERNALSYM STATUS_FVE_PIN_INVALID}
  STATUS_FVE_PIN_INVALID           =  TNTStatus($C021001A);

//
// MessageId: STATUS_FVE_AUTH_INVALID_APPLICATION
//
// MessageText:
//
// A boot application hash does not match the hash computed when BitLocker was turned on.
//
  {$EXTERNALSYM STATUS_FVE_AUTH_INVALID_APPLICATION}
  STATUS_FVE_AUTH_INVALID_APPLICATION =  TNTStatus($C021001B);

//
// MessageId: STATUS_FVE_AUTH_INVALID_CONFIG
//
// MessageText:
//
// The Boot Configuration Data (BCD) settings are not supported or have changed since BitLocker was enabled.
//
  {$EXTERNALSYM STATUS_FVE_AUTH_INVALID_CONFIG}
  STATUS_FVE_AUTH_INVALID_CONFIG   =  TNTStatus($C021001C);

//
// MessageId: STATUS_FVE_DEBUGGER_ENABLED
//
// MessageText:
//
// Boot debugging is enabled.  Run bcdedit to turn it off.
//
  {$EXTERNALSYM STATUS_FVE_DEBUGGER_ENABLED}
  STATUS_FVE_DEBUGGER_ENABLED      =  TNTStatus($C021001D);

//
// MessageId: STATUS_FVE_DRY_RUN_FAILED
//
// MessageText:
//
// The BitLocker encryption key could not be obtained.
//
  {$EXTERNALSYM STATUS_FVE_DRY_RUN_FAILED}
  STATUS_FVE_DRY_RUN_FAILED        =  TNTStatus($C021001E);

//
// MessageId: STATUS_FVE_BAD_METADATA_POINTER
//
// MessageText:
//
// The metadata disk region pointer is incorrect.
//
  {$EXTERNALSYM STATUS_FVE_BAD_METADATA_POINTER}
  STATUS_FVE_BAD_METADATA_POINTER  =  TNTStatus($C021001F);

//
// MessageId: STATUS_FVE_OLD_METADATA_COPY
//
// MessageText:
//
// The backup copy of the metadata is out of date.
//
  {$EXTERNALSYM STATUS_FVE_OLD_METADATA_COPY}
  STATUS_FVE_OLD_METADATA_COPY     =  TNTStatus($C0210020);

//
// MessageId: STATUS_FVE_REBOOT_REQUIRED
//
// MessageText:
//
// No action was taken as a system reboot is required.
//
  {$EXTERNALSYM STATUS_FVE_REBOOT_REQUIRED}
  STATUS_FVE_REBOOT_REQUIRED       =  TNTStatus($C0210021);

//
// MessageId: STATUS_FVE_RAW_ACCESS
//
// MessageText:
//
// No action was taken as BitLocker Drive Encryption is in RAW access mode.
//
  {$EXTERNALSYM STATUS_FVE_RAW_ACCESS}
  STATUS_FVE_RAW_ACCESS            =  TNTStatus($C0210022);

//
// MessageId: STATUS_FVE_RAW_BLOCKED
//
// MessageText:
//
// BitLocker Drive Encryption cannot enter raw access mode for this volume.
//
  {$EXTERNALSYM STATUS_FVE_RAW_BLOCKED}
  STATUS_FVE_RAW_BLOCKED           =  TNTStatus($C0210023);


//
// FWP error codes (fwpkclnt.sys)
//

//
// MessageId: STATUS_FWP_CALLOUT_NOT_FOUND
//
// MessageText:
//
// The callout does not exist.
//
  {$EXTERNALSYM STATUS_FWP_CALLOUT_NOT_FOUND}
  STATUS_FWP_CALLOUT_NOT_FOUND     =  TNTStatus($C0220001);

//
// MessageId: STATUS_FWP_CONDITION_NOT_FOUND
//
// MessageText:
//
// The filter condition does not exist.
//
  {$EXTERNALSYM STATUS_FWP_CONDITION_NOT_FOUND}
  STATUS_FWP_CONDITION_NOT_FOUND   =  TNTStatus($C0220002);

//
// MessageId: STATUS_FWP_FILTER_NOT_FOUND
//
// MessageText:
//
// The filter does not exist.
//
  {$EXTERNALSYM STATUS_FWP_FILTER_NOT_FOUND}
  STATUS_FWP_FILTER_NOT_FOUND      =  TNTStatus($C0220003);

//
// MessageId: STATUS_FWP_LAYER_NOT_FOUND
//
// MessageText:
//
// The layer does not exist.
//
  {$EXTERNALSYM STATUS_FWP_LAYER_NOT_FOUND}
  STATUS_FWP_LAYER_NOT_FOUND       =  TNTStatus($C0220004);

//
// MessageId: STATUS_FWP_PROVIDER_NOT_FOUND
//
// MessageText:
//
// The provider does not exist.
//
  {$EXTERNALSYM STATUS_FWP_PROVIDER_NOT_FOUND}
  STATUS_FWP_PROVIDER_NOT_FOUND    =  TNTStatus($C0220005);

//
// MessageId: STATUS_FWP_PROVIDER_CONTEXT_NOT_FOUND
//
// MessageText:
//
// The provider context does not exist.
//
  {$EXTERNALSYM STATUS_FWP_PROVIDER_CONTEXT_NOT_FOUND}
  STATUS_FWP_PROVIDER_CONTEXT_NOT_FOUND =  TNTStatus($C0220006);

//
// MessageId: STATUS_FWP_SUBLAYER_NOT_FOUND
//
// MessageText:
//
// The sublayer does not exist.
//
  {$EXTERNALSYM STATUS_FWP_SUBLAYER_NOT_FOUND}
  STATUS_FWP_SUBLAYER_NOT_FOUND    =  TNTStatus($C0220007);

//
// MessageId: STATUS_FWP_NOT_FOUND
//
// MessageText:
//
// The object does not exist.
//
  {$EXTERNALSYM STATUS_FWP_NOT_FOUND}
  STATUS_FWP_NOT_FOUND             =  TNTStatus($C0220008);

//
// MessageId: STATUS_FWP_ALREADY_EXISTS
//
// MessageText:
//
// An object with that GUID or LUID already exists.
//
  {$EXTERNALSYM STATUS_FWP_ALREADY_EXISTS}
  STATUS_FWP_ALREADY_EXISTS        =  TNTStatus($C0220009);

//
// MessageId: STATUS_FWP_IN_USE
//
// MessageText:
//
// The object is referenced by other objects so cannot be deleted.
//
  {$EXTERNALSYM STATUS_FWP_IN_USE}
  STATUS_FWP_IN_USE                =  TNTStatus($C022000A);

//
// MessageId: STATUS_FWP_DYNAMIC_SESSION_IN_PROGRESS
//
// MessageText:
//
// The call is not allowed from within a dynamic session.
//
  {$EXTERNALSYM STATUS_FWP_DYNAMIC_SESSION_IN_PROGRESS}
  STATUS_FWP_DYNAMIC_SESSION_IN_PROGRESS =  TNTStatus($C022000B);

//
// MessageId: STATUS_FWP_WRONG_SESSION
//
// MessageText:
//
// The call was made from the wrong session so cannot be completed.
//
  {$EXTERNALSYM STATUS_FWP_WRONG_SESSION}
  STATUS_FWP_WRONG_SESSION         =  TNTStatus($C022000C);

//
// MessageId: STATUS_FWP_NO_TXN_IN_PROGRESS
//
// MessageText:
//
// The call must be made from within an explicit transaction.
//
  {$EXTERNALSYM STATUS_FWP_NO_TXN_IN_PROGRESS}
  STATUS_FWP_NO_TXN_IN_PROGRESS    =  TNTStatus($C022000D);

//
// MessageId: STATUS_FWP_TXN_IN_PROGRESS
//
// MessageText:
//
// The call is not allowed from within an explicit transaction.
//
  {$EXTERNALSYM STATUS_FWP_TXN_IN_PROGRESS}
  STATUS_FWP_TXN_IN_PROGRESS       =  TNTStatus($C022000E);

//
// MessageId: STATUS_FWP_TXN_ABORTED
//
// MessageText:
//
// The explicit transaction has been forcibly cancelled.
//
  {$EXTERNALSYM STATUS_FWP_TXN_ABORTED}
  STATUS_FWP_TXN_ABORTED           =  TNTStatus($C022000F);

//
// MessageId: STATUS_FWP_SESSION_ABORTED
//
// MessageText:
//
// The session has been cancelled.
//
  {$EXTERNALSYM STATUS_FWP_SESSION_ABORTED}
  STATUS_FWP_SESSION_ABORTED       =  TNTStatus($C0220010);

//
// MessageId: STATUS_FWP_INCOMPATIBLE_TXN
//
// MessageText:
//
// The call is not allowed from within a read-only transaction.
//
  {$EXTERNALSYM STATUS_FWP_INCOMPATIBLE_TXN}
  STATUS_FWP_INCOMPATIBLE_TXN      =  TNTStatus($C0220011);

//
// MessageId: STATUS_FWP_TIMEOUT
//
// MessageText:
//
// The call timed out while waiting to acquire the transaction lock.
//
  {$EXTERNALSYM STATUS_FWP_TIMEOUT}
  STATUS_FWP_TIMEOUT               =  TNTStatus($C0220012);

//
// MessageId: STATUS_FWP_NET_EVENTS_DISABLED
//
// MessageText:
//
// Collection of network diagnostic events is disabled.
//
  {$EXTERNALSYM STATUS_FWP_NET_EVENTS_DISABLED}
  STATUS_FWP_NET_EVENTS_DISABLED   =  TNTStatus($C0220013);

//
// MessageId: STATUS_FWP_INCOMPATIBLE_LAYER
//
// MessageText:
//
// The operation is not supported by the specified layer.
//
  {$EXTERNALSYM STATUS_FWP_INCOMPATIBLE_LAYER}
  STATUS_FWP_INCOMPATIBLE_LAYER    =  TNTStatus($C0220014);

//
// MessageId: STATUS_FWP_KM_CLIENTS_ONLY
//
// MessageText:
//
// The call is allowed for kernel-mode callers only.
//
  {$EXTERNALSYM STATUS_FWP_KM_CLIENTS_ONLY}
  STATUS_FWP_KM_CLIENTS_ONLY       =  TNTStatus($C0220015);

//
// MessageId: STATUS_FWP_LIFETIME_MISMATCH
//
// MessageText:
//
// The call tried to associate two objects with incompatible lifetimes.
//
  {$EXTERNALSYM STATUS_FWP_LIFETIME_MISMATCH}
  STATUS_FWP_LIFETIME_MISMATCH     =  TNTStatus($C0220016);

//
// MessageId: STATUS_FWP_BUILTIN_OBJECT
//
// MessageText:
//
// The object is built in so cannot be deleted.
//
  {$EXTERNALSYM STATUS_FWP_BUILTIN_OBJECT}
  STATUS_FWP_BUILTIN_OBJECT        =  TNTStatus($C0220017);

//
// MessageId: STATUS_FWP_TOO_MANY_CALLOUTS
//
// MessageText:
//
// The maximum number of callouts has been reached.
//
  {$EXTERNALSYM STATUS_FWP_TOO_MANY_CALLOUTS}
  STATUS_FWP_TOO_MANY_CALLOUTS     =  TNTStatus($C0220018);

//
// MessageId: STATUS_FWP_NOTIFICATION_DROPPED
//
// MessageText:
//
// A notification could not be delivered because a message queue is at its maximum capacity.
//
  {$EXTERNALSYM STATUS_FWP_NOTIFICATION_DROPPED}
  STATUS_FWP_NOTIFICATION_DROPPED  =  TNTStatus($C0220019);

//
// MessageId: STATUS_FWP_TRAFFIC_MISMATCH
//
// MessageText:
//
// The traffic parameters do not match those for the security association context.
//
  {$EXTERNALSYM STATUS_FWP_TRAFFIC_MISMATCH}
  STATUS_FWP_TRAFFIC_MISMATCH      =  TNTStatus($C022001A);

//
// MessageId: STATUS_FWP_INCOMPATIBLE_SA_STATE
//
// MessageText:
//
// The call is not allowed for the current security association state.
//
  {$EXTERNALSYM STATUS_FWP_INCOMPATIBLE_SA_STATE}
  STATUS_FWP_INCOMPATIBLE_SA_STATE =  TNTStatus($C022001B);

//
// MessageId: STATUS_FWP_NULL_POINTER
//
// MessageText:
//
// A required pointer is null.
//
  {$EXTERNALSYM STATUS_FWP_NULL_POINTER}
  STATUS_FWP_NULL_POINTER          =  TNTStatus($C022001C);

//
// MessageId: STATUS_FWP_INVALID_ENUMERATOR
//
// MessageText:
//
// An enumerator is not valid.
//
  {$EXTERNALSYM STATUS_FWP_INVALID_ENUMERATOR}
  STATUS_FWP_INVALID_ENUMERATOR    =  TNTStatus($C022001D);

//
// MessageId: STATUS_FWP_INVALID_FLAGS
//
// MessageText:
//
// The flags field contains an invalid value.
//
  {$EXTERNALSYM STATUS_FWP_INVALID_FLAGS}
  STATUS_FWP_INVALID_FLAGS         =  TNTStatus($C022001E);

//
// MessageId: STATUS_FWP_INVALID_NET_MASK
//
// MessageText:
//
// A network mask is not valid.
//
  {$EXTERNALSYM STATUS_FWP_INVALID_NET_MASK}
  STATUS_FWP_INVALID_NET_MASK      =  TNTStatus($C022001F);

//
// MessageId: STATUS_FWP_INVALID_RANGE
//
// MessageText:
//
// An FWP_RANGE is not valid.
//
  {$EXTERNALSYM STATUS_FWP_INVALID_RANGE}
  STATUS_FWP_INVALID_RANGE         =  TNTStatus($C0220020);

//
// MessageId: STATUS_FWP_INVALID_INTERVAL
//
// MessageText:
//
// The time interval is not valid.
//
  {$EXTERNALSYM STATUS_FWP_INVALID_INTERVAL}
  STATUS_FWP_INVALID_INTERVAL      =  TNTStatus($C0220021);

//
// MessageId: STATUS_FWP_ZERO_LENGTH_ARRAY
//
// MessageText:
//
// An array that must contain at least one element is zero length.
//
  {$EXTERNALSYM STATUS_FWP_ZERO_LENGTH_ARRAY}
  STATUS_FWP_ZERO_LENGTH_ARRAY     =  TNTStatus($C0220022);

//
// MessageId: STATUS_FWP_NULL_DISPLAY_NAME
//
// MessageText:
//
// The displayData.name field cannot be null.
//
  {$EXTERNALSYM STATUS_FWP_NULL_DISPLAY_NAME}
  STATUS_FWP_NULL_DISPLAY_NAME     =  TNTStatus($C0220023);

//
// MessageId: STATUS_FWP_INVALID_ACTION_TYPE
//
// MessageText:
//
// The action type is not one of the allowed action types for a filter.
//
  {$EXTERNALSYM STATUS_FWP_INVALID_ACTION_TYPE}
  STATUS_FWP_INVALID_ACTION_TYPE   =  TNTStatus($C0220024);

//
// MessageId: STATUS_FWP_INVALID_WEIGHT
//
// MessageText:
//
// The filter weight is not valid.
//
  {$EXTERNALSYM STATUS_FWP_INVALID_WEIGHT}
  STATUS_FWP_INVALID_WEIGHT        =  TNTStatus($C0220025);

//
// MessageId: STATUS_FWP_MATCH_TYPE_MISMATCH
//
// MessageText:
//
// A filter condition contains a match type that is not compatible with the operands.
//
  {$EXTERNALSYM STATUS_FWP_MATCH_TYPE_MISMATCH}
  STATUS_FWP_MATCH_TYPE_MISMATCH   =  TNTStatus($C0220026);

//
// MessageId: STATUS_FWP_TYPE_MISMATCH
//
// MessageText:
//
// An FWP_VALUE or FWPM_CONDITION_VALUE is of the wrong type.
//
  {$EXTERNALSYM STATUS_FWP_TYPE_MISMATCH}
  STATUS_FWP_TYPE_MISMATCH         =  TNTStatus($C0220027);

//
// MessageId: STATUS_FWP_OUT_OF_BOUNDS
//
// MessageText:
//
// An integer value is outside the allowed range.
//
  {$EXTERNALSYM STATUS_FWP_OUT_OF_BOUNDS}
  STATUS_FWP_OUT_OF_BOUNDS         =  TNTStatus($C0220028);

//
// MessageId: STATUS_FWP_RESERVED
//
// MessageText:
//
// A reserved field is non-zero.
//
  {$EXTERNALSYM STATUS_FWP_RESERVED}
  STATUS_FWP_RESERVED              =  TNTStatus($C0220029);

//
// MessageId: STATUS_FWP_DUPLICATE_CONDITION
//
// MessageText:
//
// A filter cannot contain multiple conditions operating on a single field.
//
  {$EXTERNALSYM STATUS_FWP_DUPLICATE_CONDITION}
  STATUS_FWP_DUPLICATE_CONDITION   =  TNTStatus($C022002A);

//
// MessageId: STATUS_FWP_DUPLICATE_KEYMOD
//
// MessageText:
//
// A policy cannot contain the same keying module more than once.
//
  {$EXTERNALSYM STATUS_FWP_DUPLICATE_KEYMOD}
  STATUS_FWP_DUPLICATE_KEYMOD      =  TNTStatus($C022002B);

//
// MessageId: STATUS_FWP_ACTION_INCOMPATIBLE_WITH_LAYER
//
// MessageText:
//
// The action type is not compatible with the layer.
//
  {$EXTERNALSYM STATUS_FWP_ACTION_INCOMPATIBLE_WITH_LAYER}
  STATUS_FWP_ACTION_INCOMPATIBLE_WITH_LAYER =  TNTStatus($C022002C);

//
// MessageId: STATUS_FWP_ACTION_INCOMPATIBLE_WITH_SUBLAYER
//
// MessageText:
//
// The action type is not compatible with the sublayer.
//
  {$EXTERNALSYM STATUS_FWP_ACTION_INCOMPATIBLE_WITH_SUBLAYER}
  STATUS_FWP_ACTION_INCOMPATIBLE_WITH_SUBLAYER =  TNTStatus($C022002D);

//
// MessageId: STATUS_FWP_CONTEXT_INCOMPATIBLE_WITH_LAYER
//
// MessageText:
//
// The raw context or the provider context is not compatible with the layer.
//
  {$EXTERNALSYM STATUS_FWP_CONTEXT_INCOMPATIBLE_WITH_LAYER}
  STATUS_FWP_CONTEXT_INCOMPATIBLE_WITH_LAYER =  TNTStatus($C022002E);

//
// MessageId: STATUS_FWP_CONTEXT_INCOMPATIBLE_WITH_CALLOUT
//
// MessageText:
//
// The raw context or the provider context is not compatible with the callout.
//
  {$EXTERNALSYM STATUS_FWP_CONTEXT_INCOMPATIBLE_WITH_CALLOUT}
  STATUS_FWP_CONTEXT_INCOMPATIBLE_WITH_CALLOUT =  TNTStatus($C022002F);

//
// MessageId: STATUS_FWP_INCOMPATIBLE_AUTH_METHOD
//
// MessageText:
//
// The authentication method is not compatible with the policy type.
//
  {$EXTERNALSYM STATUS_FWP_INCOMPATIBLE_AUTH_METHOD}
  STATUS_FWP_INCOMPATIBLE_AUTH_METHOD =  TNTStatus($C0220030);

//
// MessageId: STATUS_FWP_INCOMPATIBLE_DH_GROUP
//
// MessageText:
//
// The Diffie-Hellman group is not compatible with the policy type.
//
  {$EXTERNALSYM STATUS_FWP_INCOMPATIBLE_DH_GROUP}
  STATUS_FWP_INCOMPATIBLE_DH_GROUP =  TNTStatus($C0220031);

//
// MessageId: STATUS_FWP_EM_NOT_SUPPORTED
//
// MessageText:
//
// An IKE policy cannot contain an Extended Mode policy.
//
  {$EXTERNALSYM STATUS_FWP_EM_NOT_SUPPORTED}
  STATUS_FWP_EM_NOT_SUPPORTED      =  TNTStatus($C0220032);

//
// MessageId: STATUS_FWP_NEVER_MATCH
//
// MessageText:
//
// The enumeration template or subscription will never match any objects.
//
  {$EXTERNALSYM STATUS_FWP_NEVER_MATCH}
  STATUS_FWP_NEVER_MATCH           =  TNTStatus($C0220033);

//
// MessageId: STATUS_FWP_PROVIDER_CONTEXT_MISMATCH
//
// MessageText:
//
// The provider context is of the wrong type.
//
  {$EXTERNALSYM STATUS_FWP_PROVIDER_CONTEXT_MISMATCH}
  STATUS_FWP_PROVIDER_CONTEXT_MISMATCH =  TNTStatus($C0220034);

//
// MessageId: STATUS_FWP_INVALID_PARAMETER
//
// MessageText:
//
// The parameter is incorrect.
//
  {$EXTERNALSYM STATUS_FWP_INVALID_PARAMETER}
  STATUS_FWP_INVALID_PARAMETER     =  TNTStatus($C0220035);

//
// MessageId: STATUS_FWP_TOO_MANY_SUBLAYERS
//
// MessageText:
//
// The maximum number of sublayers has been reached.
//
  {$EXTERNALSYM STATUS_FWP_TOO_MANY_SUBLAYERS}
  STATUS_FWP_TOO_MANY_SUBLAYERS    =  TNTStatus($C0220036);

//
// MessageId: STATUS_FWP_CALLOUT_NOTIFICATION_FAILED
//
// MessageText:
//
// The notification function for a callout returned an error.
//
  {$EXTERNALSYM STATUS_FWP_CALLOUT_NOTIFICATION_FAILED}
  STATUS_FWP_CALLOUT_NOTIFICATION_FAILED =  TNTStatus($C0220037);

//
// MessageId: STATUS_FWP_INVALID_AUTH_TRANSFORM
//
// MessageText:
//
// The IPsec authentication transform is not valid.
//
  {$EXTERNALSYM STATUS_FWP_INVALID_AUTH_TRANSFORM}
  STATUS_FWP_INVALID_AUTH_TRANSFORM =  TNTStatus($C0220038);

//
// MessageId: STATUS_FWP_INVALID_CIPHER_TRANSFORM
//
// MessageText:
//
// The IPsec cipher transform is not valid.
//
  {$EXTERNALSYM STATUS_FWP_INVALID_CIPHER_TRANSFORM}
  STATUS_FWP_INVALID_CIPHER_TRANSFORM =  TNTStatus($C0220039);

//
// MessageId: STATUS_FWP_TCPIP_NOT_READY
//
// MessageText:
//
// The TCP/IP stack is not ready.
//
  {$EXTERNALSYM STATUS_FWP_TCPIP_NOT_READY}
  STATUS_FWP_TCPIP_NOT_READY       =  TNTStatus($C0220100);

//
// MessageId: STATUS_FWP_INJECT_HANDLE_CLOSING
//
// MessageText:
//
// The injection handle is being closed by another thread.
//
  {$EXTERNALSYM STATUS_FWP_INJECT_HANDLE_CLOSING}
  STATUS_FWP_INJECT_HANDLE_CLOSING =  TNTStatus($C0220101);

//
// MessageId: STATUS_FWP_INJECT_HANDLE_STALE
//
// MessageText:
//
// The injection handle is stale.
//
  {$EXTERNALSYM STATUS_FWP_INJECT_HANDLE_STALE}
  STATUS_FWP_INJECT_HANDLE_STALE   =  TNTStatus($C0220102);

//
// MessageId: STATUS_FWP_CANNOT_PEND
//
// MessageText:
//
// The classify cannot be pended.
//
  {$EXTERNALSYM STATUS_FWP_CANNOT_PEND}
  STATUS_FWP_CANNOT_PEND           =  TNTStatus($C0220103);


//
// NDIS error codes (ndis.sys)
//

//
// MessageId: STATUS_NDIS_CLOSING
//
// MessageText:
//
// The binding to the network interface is being closed.
//
  {$EXTERNALSYM STATUS_NDIS_CLOSING}
  STATUS_NDIS_CLOSING              =  TNTStatus($C0230002);

//
// MessageId: STATUS_NDIS_BAD_VERSION
//
// MessageText:
//
// An invalid version was specified.
//
  {$EXTERNALSYM STATUS_NDIS_BAD_VERSION}
  STATUS_NDIS_BAD_VERSION          =  TNTStatus($C0230004);

//
// MessageId: STATUS_NDIS_BAD_CHARACTERISTICS
//
// MessageText:
//
// An invalid characteristics table was used.
//
  {$EXTERNALSYM STATUS_NDIS_BAD_CHARACTERISTICS}
  STATUS_NDIS_BAD_CHARACTERISTICS  =  TNTStatus($C0230005);

//
// MessageId: STATUS_NDIS_ADAPTER_NOT_FOUND
//
// MessageText:
//
// Failed to find the network interface or network interface is not ready.
//
  {$EXTERNALSYM STATUS_NDIS_ADAPTER_NOT_FOUND}
  STATUS_NDIS_ADAPTER_NOT_FOUND    =  TNTStatus($C0230006);

//
// MessageId: STATUS_NDIS_OPEN_FAILED
//
// MessageText:
//
// Failed to open the network interface.
//
  {$EXTERNALSYM STATUS_NDIS_OPEN_FAILED}
  STATUS_NDIS_OPEN_FAILED          =  TNTStatus($C0230007);

//
// MessageId: STATUS_NDIS_DEVICE_FAILED
//
// MessageText:
//
// Network interface has encountered an internal unrecoverable failure.
//
  {$EXTERNALSYM STATUS_NDIS_DEVICE_FAILED}
  STATUS_NDIS_DEVICE_FAILED        =  TNTStatus($C0230008);

//
// MessageId: STATUS_NDIS_MULTICAST_FULL
//
// MessageText:
//
// The multicast list on the network interface is full.
//
  {$EXTERNALSYM STATUS_NDIS_MULTICAST_FULL}
  STATUS_NDIS_MULTICAST_FULL       =  TNTStatus($C0230009);

//
// MessageId: STATUS_NDIS_MULTICAST_EXISTS
//
// MessageText:
//
// An attempt was made to add a duplicate multicast address to the list.
//
  {$EXTERNALSYM STATUS_NDIS_MULTICAST_EXISTS}
  STATUS_NDIS_MULTICAST_EXISTS     =  TNTStatus($C023000A);

//
// MessageId: STATUS_NDIS_MULTICAST_NOT_FOUND
//
// MessageText:
//
// At attempt was made to remove a multicast address that was never added.
//
  {$EXTERNALSYM STATUS_NDIS_MULTICAST_NOT_FOUND}
  STATUS_NDIS_MULTICAST_NOT_FOUND  =  TNTStatus($C023000B);

//
// MessageId: STATUS_NDIS_REQUEST_ABORTED
//
// MessageText:
//
// Netowork interface aborted the request.
//
  {$EXTERNALSYM STATUS_NDIS_REQUEST_ABORTED}
  STATUS_NDIS_REQUEST_ABORTED      =  TNTStatus($C023000C);

//
// MessageId: STATUS_NDIS_RESET_IN_PROGRESS
//
// MessageText:
//
// Network interface can not process the request because it is being reset.
//
  {$EXTERNALSYM STATUS_NDIS_RESET_IN_PROGRESS}
  STATUS_NDIS_RESET_IN_PROGRESS    =  TNTStatus($C023000D);

//
// MessageId: STATUS_NDIS_NOT_SUPPORTED
//
// MessageText:
//
// Netword interface does not support this request.
//
  {$EXTERNALSYM STATUS_NDIS_NOT_SUPPORTED}
  STATUS_NDIS_NOT_SUPPORTED        =  TNTStatus($C02300BB);

//
// MessageId: STATUS_NDIS_INVALID_PACKET
//
// MessageText:
//
// An attempt was made to send an invalid packet on a network interface.
//
  {$EXTERNALSYM STATUS_NDIS_INVALID_PACKET}
  STATUS_NDIS_INVALID_PACKET       =  TNTStatus($C023000F);

//
// MessageId: STATUS_NDIS_ADAPTER_NOT_READY
//
// MessageText:
//
// Network interface is not ready to complete this operation.
//
  {$EXTERNALSYM STATUS_NDIS_ADAPTER_NOT_READY}
  STATUS_NDIS_ADAPTER_NOT_READY    =  TNTStatus($C0230011);

//
// MessageId: STATUS_NDIS_INVALID_LENGTH
//
// MessageText:
//
// The length of the buffer submitted for this operation is not valid.
//
  {$EXTERNALSYM STATUS_NDIS_INVALID_LENGTH}
  STATUS_NDIS_INVALID_LENGTH       =  TNTStatus($C0230014);

//
// MessageId: STATUS_NDIS_INVALID_DATA
//
// MessageText:
//
// The data used for this operation is not valid.
//
  {$EXTERNALSYM STATUS_NDIS_INVALID_DATA}
  STATUS_NDIS_INVALID_DATA         =  TNTStatus($C0230015);

//
// MessageId: STATUS_NDIS_BUFFER_TOO_SHORT
//
// MessageText:
//
// The length of buffer submitted for this operation is too small.
//
  {$EXTERNALSYM STATUS_NDIS_BUFFER_TOO_SHORT}
  STATUS_NDIS_BUFFER_TOO_SHORT     =  TNTStatus($C0230016);

//
// MessageId: STATUS_NDIS_INVALID_OID
//
// MessageText:
//
// Network interface does not support this OID (Object Identifier)
//
  {$EXTERNALSYM STATUS_NDIS_INVALID_OID}
  STATUS_NDIS_INVALID_OID          =  TNTStatus($C0230017);

//
// MessageId: STATUS_NDIS_ADAPTER_REMOVED
//
// MessageText:
//
// The network interface has been removed.
//
  {$EXTERNALSYM STATUS_NDIS_ADAPTER_REMOVED}
  STATUS_NDIS_ADAPTER_REMOVED      =  TNTStatus($C0230018);

//
// MessageId: STATUS_NDIS_UNSUPPORTED_MEDIA
//
// MessageText:
//
// Network interface does not support this media type.
//
  {$EXTERNALSYM STATUS_NDIS_UNSUPPORTED_MEDIA}
  STATUS_NDIS_UNSUPPORTED_MEDIA    =  TNTStatus($C0230019);

//
// MessageId: STATUS_NDIS_GROUP_ADDRESS_IN_USE
//
// MessageText:
//
// An attempt was made to remove a token ring group address that is in use by other components.
//
  {$EXTERNALSYM STATUS_NDIS_GROUP_ADDRESS_IN_USE}
  STATUS_NDIS_GROUP_ADDRESS_IN_USE =  TNTStatus($C023001A);

//
// MessageId: STATUS_NDIS_FILE_NOT_FOUND
//
// MessageText:
//
// An attempt was made to map a file that can not be found.
//
  {$EXTERNALSYM STATUS_NDIS_FILE_NOT_FOUND}
  STATUS_NDIS_FILE_NOT_FOUND       =  TNTStatus($C023001B);

//
// MessageId: STATUS_NDIS_ERROR_READING_FILE
//
// MessageText:
//
// An error occured while NDIS tried to map the file.
//
  {$EXTERNALSYM STATUS_NDIS_ERROR_READING_FILE}
  STATUS_NDIS_ERROR_READING_FILE   =  TNTStatus($C023001C);

//
// MessageId: STATUS_NDIS_ALREADY_MAPPED
//
// MessageText:
//
// An attempt was made to map a file that is alreay mapped.
//
  {$EXTERNALSYM STATUS_NDIS_ALREADY_MAPPED}
  STATUS_NDIS_ALREADY_MAPPED       =  TNTStatus($C023001D);

//
// MessageId: STATUS_NDIS_RESOURCE_CONFLICT
//
// MessageText:
//
// An attempt to allocate a hardware resource failed because the resource is used by another component.
//
  {$EXTERNALSYM STATUS_NDIS_RESOURCE_CONFLICT}
  STATUS_NDIS_RESOURCE_CONFLICT    =  TNTStatus($C023001E);

//
// MessageId: STATUS_NDIS_MEDIA_DISCONNECTED
//
// MessageText:
//
// The I/O operation failed because network media is disconnected or wireless access point is out of range.
//
  {$EXTERNALSYM STATUS_NDIS_MEDIA_DISCONNECTED}
  STATUS_NDIS_MEDIA_DISCONNECTED   =  TNTStatus($C023001F);

//
// MessageId: STATUS_NDIS_INVALID_ADDRESS
//
// MessageText:
//
// The network address used in the request is invalid.
//
  {$EXTERNALSYM STATUS_NDIS_INVALID_ADDRESS}
  STATUS_NDIS_INVALID_ADDRESS      =  TNTStatus($C0230022);

//
// MessageId: STATUS_NDIS_INVALID_DEVICE_REQUEST
//
// MessageText:
//
// The specified request is not a valid operation for the target device.
//
  {$EXTERNALSYM STATUS_NDIS_INVALID_DEVICE_REQUEST}
  STATUS_NDIS_INVALID_DEVICE_REQUEST =  TNTStatus($C0230010);

//
// MessageId: STATUS_NDIS_PAUSED
//
// MessageText:
//
// The offload operation on the network interface has been paused.
//
  {$EXTERNALSYM STATUS_NDIS_PAUSED}
  STATUS_NDIS_PAUSED               =  TNTStatus($C023002A);

//
// MessageId: STATUS_NDIS_INTERFACE_NOT_FOUND
//
// MessageText:
//
// Network interface was not found.
//
  {$EXTERNALSYM STATUS_NDIS_INTERFACE_NOT_FOUND}
  STATUS_NDIS_INTERFACE_NOT_FOUND  =  TNTStatus($C023002B);

//
// MessageId: STATUS_NDIS_UNSUPPORTED_REVISION
//
// MessageText:
//
// The revision number specified in the structure is not supported.
//
  {$EXTERNALSYM STATUS_NDIS_UNSUPPORTED_REVISION}
  STATUS_NDIS_UNSUPPORTED_REVISION =  TNTStatus($C023002C);

//
// MessageId: STATUS_NDIS_INVALID_PORT
//
// MessageText:
//
// The specified port does not exist on this network interface.
//
  {$EXTERNALSYM STATUS_NDIS_INVALID_PORT}
  STATUS_NDIS_INVALID_PORT         =  TNTStatus($C023002D);

//
// MessageId: STATUS_NDIS_INVALID_PORT_STATE
//
// MessageText:
//
// The current state of the specified port on this network interface does not support the requested operation.
//
  {$EXTERNALSYM STATUS_NDIS_INVALID_PORT_STATE}
  STATUS_NDIS_INVALID_PORT_STATE   =  TNTStatus($C023002E);

//
// MessageId: STATUS_NDIS_LOW_POWER_STATE
//
// MessageText:
//
// The miniport adapter is in lower power state.
//
  {$EXTERNALSYM STATUS_NDIS_LOW_POWER_STATE}
  STATUS_NDIS_LOW_POWER_STATE      =  TNTStatus($C023002F);


//
// NDIS error codes (802.11 wireless LAN)
//

//
// MessageId: STATUS_NDIS_DOT11_AUTO_CONFIG_ENABLED
//
// MessageText:
//
// The wireless local area network interface is in auto configuration mode and doesn't support the requested parameter change operation.
//
  {$EXTERNALSYM STATUS_NDIS_DOT11_AUTO_CONFIG_ENABLED}
  STATUS_NDIS_DOT11_AUTO_CONFIG_ENABLED =  TNTStatus($C0232000);

//
// MessageId: STATUS_NDIS_DOT11_MEDIA_IN_USE
//
// MessageText:
//
// The wireless local area network interface is busy and can not perform the requested operation.
//
  {$EXTERNALSYM STATUS_NDIS_DOT11_MEDIA_IN_USE}
  STATUS_NDIS_DOT11_MEDIA_IN_USE   =  TNTStatus($C0232001);

//
// MessageId: STATUS_NDIS_DOT11_POWER_STATE_INVALID
//
// MessageText:
//
// The wireless local area network interface is power down and doesn't support the requested operation.
//
  {$EXTERNALSYM STATUS_NDIS_DOT11_POWER_STATE_INVALID}
  STATUS_NDIS_DOT11_POWER_STATE_INVALID =  TNTStatus($C0232002);

//
// NDIS informational codes(ndis.sys)
//

//
// MessageId: STATUS_NDIS_INDICATION_REQUIRED
//
// MessageText:
//
// The request will be completed later by NDIS status indication.
//
  {$EXTERNALSYM STATUS_NDIS_INDICATION_REQUIRED}
  STATUS_NDIS_INDICATION_REQUIRED  =  TNTStatus($40230001);


//
// IPSEC error codes (tcpip.sys)
//

//
// MessageId: STATUS_IPSEC_BAD_SPI
//
// MessageText:
//
// The SPI in the packet does not match a valid IPsec SA.
//
  {$EXTERNALSYM STATUS_IPSEC_BAD_SPI}
  STATUS_IPSEC_BAD_SPI             =  TNTStatus($C0360001);

//
// MessageId: STATUS_IPSEC_SA_LIFETIME_EXPIRED
//
// MessageText:
//
// Packet was received on an IPsec SA whose lifetime has expired.
//
  {$EXTERNALSYM STATUS_IPSEC_SA_LIFETIME_EXPIRED}
  STATUS_IPSEC_SA_LIFETIME_EXPIRED =  TNTStatus($C0360002);

//
// MessageId: STATUS_IPSEC_WRONG_SA
//
// MessageText:
//
// Packet was received on an IPsec SA that doesn't match the packet characteristics.
//
  {$EXTERNALSYM STATUS_IPSEC_WRONG_SA}
  STATUS_IPSEC_WRONG_SA            =  TNTStatus($C0360003);

//
// MessageId: STATUS_IPSEC_REPLAY_CHECK_FAILED
//
// MessageText:
//
// Packet sequence number replay check failed.
//
  {$EXTERNALSYM STATUS_IPSEC_REPLAY_CHECK_FAILED}
  STATUS_IPSEC_REPLAY_CHECK_FAILED =  TNTStatus($C0360004);

//
// MessageId: STATUS_IPSEC_INVALID_PACKET
//
// MessageText:
//
// IPsec header and/or trailer in the packet is invalid.
//
  {$EXTERNALSYM STATUS_IPSEC_INVALID_PACKET}
  STATUS_IPSEC_INVALID_PACKET      =  TNTStatus($C0360005);

//
// MessageId: STATUS_IPSEC_INTEGRITY_CHECK_FAILED
//
// MessageText:
//
// IPsec integrity check failed.
//
  {$EXTERNALSYM STATUS_IPSEC_INTEGRITY_CHECK_FAILED}
  STATUS_IPSEC_INTEGRITY_CHECK_FAILED =  TNTStatus($C0360006);

//
// MessageId: STATUS_IPSEC_CLEAR_TEXT_DROP
//
// MessageText:
//
// IPsec dropped a clear text packet.
//
  {$EXTERNALSYM STATUS_IPSEC_CLEAR_TEXT_DROP}
  STATUS_IPSEC_CLEAR_TEXT_DROP     =  TNTStatus($C0360007);

//
// Map a WIN32 error value into an TNTStatus
// Note: This assumes that WIN32 errors fall in the range -32k to 32k.
//

{$EXTERNALSYM __NTSTATUS_FROM_WIN32}
function __NTSTATUS_FROM_WIN32(x: TNTStatus): TNTStatus; {$IfDef HAS_INLINE}inline;{$EndIf}
{$EXTERNALSYM NTSTATUS_FROM_WIN32}
function NTSTATUS_FROM_WIN32(x: TNTStatus): TNTStatus; {$IfDef HAS_INLINE}inline;{$EndIf}

implementation

function FILTER_FLT_NTSTATUS_FROM_HRESULT(x: HRESULT): TNTStatus;
begin
  Result := TNTStatus((x and $C0007FFF) or
                     (FACILITY_FILTER_MANAGER shl 16) or
                     ($40000000));
end;

function __NTSTATUS_FROM_WIN32(x: TNTStatus): TNTStatus;
begin
  if x <= 0 then
    Result := x
  else
    Result := (x and $0000FFFF) or (FACILITY_NTWIN32 shl 16) or ERROR_SEVERITY_ERROR;
end;

function NTSTATUS_FROM_WIN32(x: TNTStatus): TNTStatus;
begin
  if x <= 0 then
    Result := x
  else
    Result := (x and $0000FFFF) or (FACILITY_NTWIN32 shl 16) or ERROR_SEVERITY_ERROR;
end;


end.
