	.syntax unified
	.set AsyncEkrDispUP, 0x08052888 + 1
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set CheckEkrWindowAppearUnexist, 0x08057CFC + 1
	.set EkrGauge_Set4C50, 0x08051EC4 + 1
	.set EnableEkrGauge, 0x08051F4C + 1
	.set sub_808583C, 0x0808583C + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8050DC8, "ax", %progbits
@ sub_8050DC8 @ JP 0x08050DC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050DC8
	.thumb_func
sub_8050DC8:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08050E52
	bl EnableEkrGauge
	bl AsyncEkrDispUP
	movs r0, #0
	str r0, [sp]
	ldr r1, _08050E2C @ =0x02022CA8
	ldr r2, _08050E30 @ =0x01000200
	mov r0, sp
	bl sub_80D636C
	ldr r0, _08050E34 @ =0x02000038
	ldrh r1, [r0]
	ldrh r2, [r0, #2]
	movs r0, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	bl BG_EnableSyncByMask
	bl EkrGauge_Set4C50
	ldr r0, [r4, #0x54]
	cmp r0, #1
	bne _08050E4E
	ldr r0, _08050E38 @ =0x0203E0FC
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08050E40
	ldr r1, _08050E3C @ =0x0203E18C
	ldrb r0, [r1]
	ldrb r1, [r1, #1]
	bl sub_808583C
	b _08050E4A
	.align 2, 0
_08050E2C: .4byte 0x02022CA8
_08050E30: .4byte 0x01000200
_08050E34: .4byte 0x02000038
_08050E38: .4byte 0x0203E0FC
_08050E3C: .4byte 0x0203E18C
_08050E40:
	ldr r1, _08050E5C @ =0x0203E18C
	ldrb r0, [r1, #1]
	ldrb r1, [r1]
	bl sub_808583C
_08050E4A:
	movs r0, #0
	str r0, [r4, #0x54]
_08050E4E:
	ldr r0, _08050E60 @ =sub_8050E64
	str r0, [r4, #0xc]
_08050E52:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050E5C: .4byte 0x0203E18C
_08050E60: .4byte 0x08050E65  @ sub_8050E64

