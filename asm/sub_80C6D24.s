	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set SkipGmNodeIconDisplay, 0x080C052C + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_804F8E0, 0x0804F8E0 + 1
	.set sub_80BDCDC, 0x080BDCDC + 1
	.section .text.sub_80C6D24, "ax", %progbits
@ sub_80C6D24 @ JP 0x080C6D24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6D24
	.thumb_func
sub_80C6D24:
	push {r4, lr}
	ldr r4, _080C6D88 @ =0x08AC1108
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r1, [r0, #0x4c]
	adds r1, #0x31
	ldrb r2, [r1]
	movs r0, #4
	orrs r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x44]
	ldr r1, [r0, #0x4c]
	adds r1, #0x31
	ldrb r2, [r1]
	movs r0, #3
	orrs r0, r2
	strb r0, [r1]
	adds r0, r4, #0
	bl Proc_Find
	ldr r0, [r0, #0x48]
	bl SkipGmNodeIconDisplay
	bl sub_80BDCDC
	bl sub_801569C
	ldr r0, _080C6D8C @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_804F8E0
	ldr r2, _080C6D90 @ =0x03005270
	ldrb r1, [r2]
	movs r0, #9
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C6D88: .4byte 0x08AC1108
_080C6D8C: .4byte 0x020234A8
_080C6D90: .4byte 0x03005270

