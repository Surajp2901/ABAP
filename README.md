# SAP BTP ABAP RAP – Sales Order Self-Service Portal

This repository contains an ABAP RAP-based application developed on 
SAP BTP ABAP Environment, providing customers with a self-service 
portal to view and track Sales Orders in real time.

---

## Objective
- Enable customers to view Sales Orders and item details without 
  depending on sales teams
- Improve transparency and real-time visibility
- Demonstrate clean-core, side-by-side extensibility using ABAP RAP

---

## Scope
- Display Sales Order header and item details from SAP S/4 simulation (ES5)
- Search and filter by order ID, date, status etc
- Allow customers to add notes and special instructions (BTP-side)
- Responsive UI using Fiori Elements

---

## Technology Stack
- SAP BTP ABAP Environment (ABAP RAP)
- SAP Gateway ES5 OData Service
- OData V4 (RAP-generated)
- SAP Fiori Elements
- Clean-core, side-by-side architecture

---

## Architecture Overview
- ABAP Cloud application consumes Sales Order data via public ES5 OData APIs
- Core S/4 system remains untouched
- Custom logic and extensions handled in ABAP Cloud layer
- RAP exposes data automatically as OData V4 services for UI consumption

---

## RAP Data Model
- RAP Business Object with:
  - Root entity: Sales Order (Header)
  - Child entity: Sales Order Items
- Standard RAP structure:
  - Definition → Projection → Behavior → Service Binding
- Managed scenario with draft support

---

## Business Logic
- Behavior implementation handles validations and processing
- Sales Order data fetched in real time from ES5
- RAP manages authorization, draft handling, search, and UI annotations
- Data mapped into RAP entities and rendered via Fiori Elements

---

## Key Highlights
- Clean separation between system-of-record (S/4 / ES5) and innovation layer (BTP)
- No backend modification — fully upgrade-safe
- RAP-driven UI generation ensures consistent UX and faster development
- Extensible design suitable for real S/4HANA integration in future

---

## Repository Notes
- Source code includes RAP BO, behavior definitions, implementations, and annotations
- Designed as a reference for clean-core, API-driven ABAP Cloud development
