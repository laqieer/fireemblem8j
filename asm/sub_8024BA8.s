	.syntax unified
	.set StartItemHelpBox, 0x0808B0EC + 1
	.section .text.sub_8024BA8, "ax", %progbits
@ sub_8024BA8 @ JP 0x08024BA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024BA8
	.thumb_func
sub_8024BA8:
	push {r4, lr}
	adds r3, r1, #0
	adds r2, r3, #0
	adds r2, #0x3c
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	bne _08024BC4
	ldr r0, _08024BC0 @ =0x0202BCAC
	ldrh r2, [r0, #0x2c]
	b _08024BD6
	.align 2, 0
_08024BC0: .4byte 0x0202BCAC
_08024BC4:
	ldr r0, _08024BEC @ =0x03004DF0
	ldr r1, [r0]
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #1
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r2, [r1]
_08024BD6:
	movs r1, #0x2a
	ldrsh r0, [r3, r1]
	lsls r0, r0, #3
	movs r4, #0x2c
	ldrsh r1, [r3, r4]
	lsls r1, r1, #3
	bl StartItemHelpBox
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08024BEC: .4byte 0x03004DF0

