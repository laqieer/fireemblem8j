	.syntax unified
	.set sub_8013008, 0x08013008 + 1
	.set sub_8026900, 0x08026900 + 1
	.set sub_80269DC, 0x080269DC + 1
	.set sub_8026ACC, 0x08026ACC + 1
	.section .text.sub_8026694, "ax", %progbits
@ sub_8026694 @ JP 0x08026694 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8026694
	.thumb_func
sub_8026694:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	mov r8, r1
	ldr r1, _080266D0 @ =0x085C3B4C
	mov r2, r8
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r6, [r0]
	ldr r5, _080266D4 @ =0x08903E0C
	movs r4, #0x7f
	ands r4, r7
	lsls r4, r4, #3
	adds r0, r5, #4
	adds r0, r4, r0
	ldr r0, [r0]
	ldr r1, _080266D8 @ =0x085C3B48
	ldr r1, [r1]
	bl sub_8013008
	adds r4, r4, r5
	ldrh r0, [r4, #2]
	cmp r0, #1
	beq _080266EC
	cmp r0, #1
	bgt _080266DC
	cmp r0, #0
	beq _080266E2
	b _0802670A
	.align 2, 0
_080266D0: .4byte 0x085C3B4C
_080266D4: .4byte 0x08903E0C
_080266D8: .4byte 0x085C3B48
_080266DC:
	cmp r0, #2
	beq _080266F6
	b _0802670A
_080266E2:
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_8026900
	b _080266FE
_080266EC:
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_80269DC
	b _080266FE
_080266F6:
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_8026ACC
_080266FE:
	ldr r2, _0802671C @ =0x02033F3C
	add r2, r8
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	strb r0, [r2]
_0802670A:
	ldr r0, _0802671C @ =0x02033F3C
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #1
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0802671C: .4byte 0x02033F3C

