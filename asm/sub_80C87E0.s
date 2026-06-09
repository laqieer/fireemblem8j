	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_80C87E0, "ax", %progbits
@ sub_80C87E0 @ JP 0x080C87E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C87E0
	.thumb_func
sub_80C87E0:
	push {lr}
	ldr r0, _080C880C @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x50]
	adds r0, #0x34
	ldrb r1, [r0]
	ldr r2, _080C8810 @ =0x02022BC8
	lsls r1, r1, #1
	ldr r0, _080C8814 @ =0x08B27200
	adds r0, r1, r0
	ldrh r0, [r0]
	strh r0, [r2, #0x12]
	ldr r0, _080C8818 @ =0x08B27220
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r2, #0xe]
	bl sub_8001EE4
	pop {r0}
	bx r0
	.align 2, 0
_080C880C: .4byte 0x08AC1108
_080C8810: .4byte 0x02022BC8
_080C8814: .4byte 0x08B27200
_080C8818: .4byte 0x08B27220

