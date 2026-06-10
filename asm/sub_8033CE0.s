	.syntax unified
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.section .text.sub_8033CE0, "ax", %progbits
@ sub_8033CE0 @ JP 0x08033CE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033CE0
	.thumb_func
sub_8033CE0:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _08033D0C @ =0x03004DF0
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl SetCursorMapPosition
	ldr r0, [r4]
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	adds r0, r5, #0
	bl sub_8015E18
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08033D0C: .4byte 0x03004DF0

