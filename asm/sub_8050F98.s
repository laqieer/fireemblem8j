	.syntax unified
	.set CheckEfrDragonStatusAttrPrepared, 0x080721A8 + 1
	.section .text.sub_8050F98, "ax", %progbits
@ sub_8050F98 @ JP 0x08050F98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050F98
	.thumb_func
sub_8050F98:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl CheckEfrDragonStatusAttrPrepared
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08050FAE
	ldr r0, _08050FB4 @ =sub_8050EE8
	str r0, [r4, #0xc]
_08050FAE:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050FB4: .4byte 0x08050EE9  @ sub_8050EE8

