	.syntax unified
	.set CheckEkrLvupDone, 0x080759D4 + 1
	.set sub_80759F4, 0x080759F4 + 1
	.section .text.sub_80519A0, "ax", %progbits
@ sub_80519A0 @ JP 0x080519A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80519A0
	.thumb_func
sub_80519A0:
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrLvupDone
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080519B8
	bl sub_80759F4
	ldr r0, _080519C0 @ =sub_80519C4
	str r0, [r4, #0xc]
_080519B8:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080519C0: .4byte 0x080519C5  @ sub_80519C4

