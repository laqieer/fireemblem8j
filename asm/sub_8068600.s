	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_8068600, "ax", %progbits
@ sub_8068600 @ JP 0x08068600 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8068600
	.thumb_func
sub_8068600:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	adds r4, r0, #0
	mov r8, r1
	ldr r0, [sp, #0x54]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x10
	mov sb, r2
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	mov sl, r3
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	add r1, sp, #4
	ldr r0, _08068670 @ =0x080E38E0
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	ldm r0!, {r2, r3, r6}
	stm r1!, {r2, r3, r6}
	adds r0, r4, #0
	bl GetAnimPosition
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r1, _08068674 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08068678 @ =0x08601E64
	movs r1, #3
	bl sub_8002BCC
	adds r7, r0, #0
	adds r0, r4, #0
	bl GetAnimAnotherSide
	str r0, [r7, #0x5c]
	movs r0, #0
	strh r0, [r7, #0x2c]
	mov r0, r8
	strh r0, [r7, #0x2e]
	cmp r5, #5
	bhi _080686C0
	lsls r0, r5, #2
	ldr r1, _0806867C @ =_08068680
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08068670: .4byte 0x080E38E0
_08068674: .4byte 0x0201774C
_08068678: .4byte 0x08601E64
_0806867C: .4byte _08068680
_08068680: @ jump table
	.4byte _080686C0 @ case 0
	.4byte _08068698 @ case 1
	.4byte _080686A0 @ case 2
	.4byte _080686A8 @ case 3
	.4byte _080686B0 @ case 4
	.4byte _080686B8 @ case 5
_08068698:
	lsls r1, r6, #2
	add r0, sp, #0xc
	adds r0, r0, r1
	b _080686C6
_080686A0:
	lsls r1, r6, #2
	add r0, sp, #0x14
	adds r0, r0, r1
	b _080686C6
_080686A8:
	lsls r1, r6, #2
	add r0, sp, #0x1c
	adds r0, r0, r1
	b _080686C6
_080686B0:
	lsls r1, r6, #2
	add r0, sp, #0x24
	adds r0, r0, r1
	b _080686C6
_080686B8:
	lsls r1, r6, #2
	add r0, sp, #0x2c
	adds r0, r0, r1
	b _080686C6
_080686C0:
	lsls r0, r6, #2
	add r0, sp
	adds r0, #4
_080686C6:
	ldr r3, [r0]
	ldr r0, [r7, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r7, #0x60]
	mov r1, sb
	strh r1, [r0, #2]
	mov r2, sl
	strh r2, [r0, #4]
	ldrh r2, [r0, #8]
	ldr r1, _08068700 @ =0x0000F3FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068700: .4byte 0x0000F3FF

