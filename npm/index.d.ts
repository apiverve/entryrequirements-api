declare module '@apiverve/entryrequirements' {
  export interface entryrequirementsOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface entryrequirementsResponse {
    status: string;
    error: string | null;
    data: TravelEntryRequirementsData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface TravelEntryRequirementsData {
      destination:        null | string;
      destinationName:    null | string;
      passportValidity:   PassportValidity;
      blankPagesRequired: number | null;
      passportCheck:      null;
      yellowFever:        YellowFever;
      advisories:         Advisories;
      rulesUpdatedAt:     Date | null;
      updatedAt:          Date | null;
  }
  
  interface Advisories {
      uk: Uk;
      us: Us;
  }
  
  interface Uk {
      level: null | string;
      label: null | string;
      url:   null | string;
  }
  
  interface Us {
      level: number | null;
      label: null | string;
      url:   null | string;
  }
  
  interface PassportValidity {
      rule:              null | string;
      months:            number | null;
      days:              null;
      summary:           null | string;
      issuedWithinYears: null;
      guidance:          null | string;
  }
  
  interface YellowFever {
      certificate:      null | string;
      certificateLabel: null | string;
      guidance:         null | string;
  }

  export default class entryrequirementsWrapper {
    constructor(options: entryrequirementsOptions);

    execute(callback: (error: any, data: entryrequirementsResponse | null) => void): Promise<entryrequirementsResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: entryrequirementsResponse | null) => void): Promise<entryrequirementsResponse>;
    execute(query?: Record<string, any>): Promise<entryrequirementsResponse>;
  }
}
