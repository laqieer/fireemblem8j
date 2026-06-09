	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8075528, "ax", %progbits
@ sub_8075528 @ JP 0x08075528 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8075528
	.thumb_func
sub_8075528:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	lsls r4, r1, #0x18
	lsrs r4, r4, #0x18
	ldr r0, _08075544 @ =0x087A9760
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	cmp r4, #0
	bne _08075548
	str r6, [r5, #0x5c]
	b _08075550
	.align 2, 0
_08075544: .4byte 0x087A9760
_08075548:
	adds r0, r6, #0
	bl GetAnimAnotherSide
	str r0, [r5, #0x5c]
_08075550:
	ldr r3, _0807557C @ =0x087E6EE0
	ldr r0, [r5, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r5, #0x60]
	ldr r0, _08075580 @ =0x087E66EC
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _08075584 @ =0x087E62F4
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807557C: .4byte 0x087E6EE0
_08075580: .4byte 0x087E66EC
_08075584: .4byte 0x087E62F4

