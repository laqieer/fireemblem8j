	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B2034, "ax", %progbits
@ ConfigSysHandCursorShadowEnabled @ JP 0x080B2034 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ConfigSysHandCursorShadowEnabled
	.thumb_func
ConfigSysHandCursorShadowEnabled:
	push {r4, lr}
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	ldr r0, _080B2050 @ =0x08A9DB84
	bl Proc_Find
	cmp r0, #0
	beq _080B2048
	adds r0, #0x34
	strb r4, [r0]
_080B2048:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B2050: .4byte 0x08A9DB84

