	.syntax unified
	.set EndOpAnimfxTerminator, 0x080CB698 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80B2874, 0x080B2874 + 1
	.set sub_80CC0E0, 0x080CC0E0 + 1
	.section .text.sub_80D0D58, "ax", %progbits
@ sub_80D0D58 @ JP 0x080D0D58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D0D58
	.thumb_func
sub_80D0D58:
	push {r4, lr}
	bl sub_80B2874
	bl sub_80CC0E0
	movs r0, #0
	bl SetPrimaryHBlankHandler
	bl EndOpAnimfxTerminator
	ldr r4, _080D0DA8 @ =0x03003020
	ldrb r1, [r4]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	ldr r1, _080D0DAC @ =0x020228A8
	ldr r0, _080D0DB0 @ =0x02022188
	ldrh r0, [r0, #0xc]
	strh r0, [r1]
	bl sub_8001EE4
	ldrb r1, [r4, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0DA8: .4byte 0x03003020
_080D0DAC: .4byte 0x020228A8
_080D0DB0: .4byte 0x02022188

