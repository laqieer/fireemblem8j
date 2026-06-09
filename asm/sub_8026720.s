	.syntax unified
	.set sub_8013008, 0x08013008 + 1
	.set sub_8026900, 0x08026900 + 1
	.set sub_80269DC, 0x080269DC + 1
	.set sub_8026ACC, 0x08026ACC + 1
	.section .text.sub_8026720, "ax", %progbits
@ sub_8026720 @ JP 0x08026720 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8026720
	.thumb_func
sub_8026720:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov r8, r1
	adds r7, r2, #0
	ldr r5, _08026754 @ =0x08903E0C
	movs r4, #0x7f
	ands r4, r6
	lsls r4, r4, #3
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _08026758 @ =0x085C3B48
	ldr r1, [r1]
	bl sub_8013008
	adds r4, r4, r5
	ldrh r0, [r4, #2]
	cmp r0, #1
	beq _0802676C
	cmp r0, #1
	bgt _0802675C
	cmp r0, #0
	beq _08026762
	b _0802678A
	.align 2, 0
_08026754: .4byte 0x08903E0C
_08026758: .4byte 0x085C3B48
_0802675C:
	cmp r0, #2
	beq _08026776
	b _0802678A
_08026762:
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8026900
	b _0802677E
_0802676C:
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_80269DC
	b _0802677E
_08026776:
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_8026ACC
_0802677E:
	ldr r2, _0802679C @ =0x02033F3C
	add r2, r8
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2]
_0802678A:
	ldr r0, _0802679C @ =0x02033F3C
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #1
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802679C: .4byte 0x02033F3C

