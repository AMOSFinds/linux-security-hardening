# Linux Security Baseline Project
**Project Date:** July 12, 2025  
**Environment:** WSL2 Ubuntu 24.04 LTS  
**Objective:** Implement automated security hardening and document improvements

## Executive Summary
Successfully implemented comprehensive Linux security hardening using automated script deployment. Achieved **68/100 security score** (246 security tests) representing significant improvement from baseline Ubuntu installation.

## Security Improvements Implemented

### 1. System Updates & Patch Management
- Automated security updates configured
- System fully updated to latest packages
- Unattended upgrades enabled for security patches

### 2. Security Tools Deployment
- **Lynis** - Security auditing and system hardening
- **Fail2ban** - Intrusion prevention system  
- **Rootkit Hunter** - Rootkit detection and removal
- **Chkrootkit** - Additional rootkit detection

### 3. File System Security
- Critical system files secured:
  - `/etc/passwd` - Set to 644 permissions
  - `/etc/shadow` - Set to 600 permissions (root only)
  - `/etc/group` - Set to 640 permissions

### 4. Password Security
- Password complexity requirements implemented
- Minimum password length increased to 12 characters
- PAM (Pluggable Authentication Modules) configured

### 5. System Monitoring
- System logging (rsyslog) enabled and configured
- Log monitoring capabilities established
- Security event tracking implemented

## Security Assessment Results

**Lynis Security Audit:**
- **Hardening Index:** 68/100
- **Tests Performed:** 246
- **Security Tools:** 4 deployed successfully
- **Risk Level:** Significantly reduced from baseline

## Before/After Comparison

| Category | Before | After |
|----------|--------|-------|
| Security Tools | 0 | 4 professional tools |
| Password Policy | Default | Hardened (12+ chars) |
| File Permissions | Default | Secured critical files |
| Monitoring | Basic | Enhanced logging |
| Update Management | Manual | Automated security updates |

## Technical Implementation

**Hardening Script Features:**
- Automated execution of 10 security measures
- Error handling and progress reporting
- Backup creation for critical configurations
- Comprehensive security tool deployment

**Tools Verification:**
```bash
# Security tools successfully installed:
- Lynis: Security auditing
- Fail2ban: Intrusion prevention  
- Rootkit Hunter: Malware detection
- Chkrootkit: Additional security scanning
