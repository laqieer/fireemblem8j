	.syntax unified
	.set Roll2RN, 0x08000C90 + 1
	.section .text.sub_802A4C0, "ax", %progbits
@ sub_802A4C0 @ JP 0x0802A4C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802A4C0
	.thumb_func
sub_802A4C0:
	push {lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	asrs r2, r1, #0x18
	ldr r0, _0802A4E4 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0802A4E8
	adds r0, r3, #0
	bl Roll2RN
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0802A4EA
	.align 2, 0
_0802A4E4: .4byte 0x0203A4D0
_0802A4E8:
	adds r0, r2, #0
_0802A4EA:
	pop {r1}
	bx r1
	.align 2, 0

