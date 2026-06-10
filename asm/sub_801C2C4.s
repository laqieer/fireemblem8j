	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8003750, 0x08003750 + 1
	.set sub_801C2B8, 0x0801C2B8 + 1
	.section .text.sub_801C2C4, "ax", %progbits
@ sub_801C2C4 @ JP 0x0801C2C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C2C4
	.thumb_func
sub_801C2C4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r3, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	mov r1, sp
	ldr r0, _0801C308 @ =0x080DC760
	ldm r0!, {r2, r5, r6}
	stm r1!, {r2, r5, r6}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, _0801C30C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801C310
	adds r1, r3, #0
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x3b
	bls _0801C32C
	movs r0, #0
	b _0801C32A
	.align 2, 0
_0801C308: .4byte 0x080DC760
_0801C30C: .4byte 0x085775CC
_0801C310:
	movs r0, #0x20
	ands r0, r1
	adds r1, r3, #0
	adds r1, #0x3c
	cmp r0, #0
	beq _0801C32C
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bge _0801C32C
	movs r0, #0x3b
_0801C32A:
	strb r0, [r1]
_0801C32C:
	movs r0, #0
	ldrsb r0, [r1, r0]
	bl sub_801C2B8
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0x3e
	bls _0801C33E
	b _0801C460
_0801C33E:
	lsls r0, r2, #2
	ldr r1, _0801C348 @ =_0801C34C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0801C348: .4byte _0801C34C
_0801C34C: @ jump table
	.4byte _0801C448 @ case 0
	.4byte _0801C448 @ case 1
	.4byte _0801C448 @ case 2
	.4byte _0801C448 @ case 3
	.4byte _0801C448 @ case 4
	.4byte _0801C448 @ case 5
	.4byte _0801C448 @ case 6
	.4byte _0801C448 @ case 7
	.4byte _0801C448 @ case 8
	.4byte _0801C448 @ case 9
	.4byte _0801C480 @ case 10
	.4byte _0801C480 @ case 11
	.4byte _0801C480 @ case 12
	.4byte _0801C480 @ case 13
	.4byte _0801C480 @ case 14
	.4byte _0801C480 @ case 15
	.4byte _0801C480 @ case 16
	.4byte _0801C480 @ case 17
	.4byte _0801C480 @ case 18
	.4byte _0801C480 @ case 19
	.4byte _0801C480 @ case 20
	.4byte _0801C480 @ case 21
	.4byte _0801C480 @ case 22
	.4byte _0801C454 @ case 23
	.4byte _0801C454 @ case 24
	.4byte _0801C454 @ case 25
	.4byte _0801C454 @ case 26
	.4byte _0801C454 @ case 27
	.4byte _0801C454 @ case 28
	.4byte _0801C454 @ case 29
	.4byte _0801C454 @ case 30
	.4byte _0801C454 @ case 31
	.4byte _0801C454 @ case 32
	.4byte _0801C454 @ case 33
	.4byte _0801C454 @ case 34
	.4byte _0801C454 @ case 35
	.4byte _0801C460 @ case 36
	.4byte _0801C460 @ case 37
	.4byte _0801C460 @ case 38
	.4byte _0801C460 @ case 39
	.4byte _0801C460 @ case 40
	.4byte _0801C460 @ case 41
	.4byte _0801C460 @ case 42
	.4byte _0801C460 @ case 43
	.4byte _0801C460 @ case 44
	.4byte _0801C460 @ case 45
	.4byte _0801C460 @ case 46
	.4byte _0801C460 @ case 47
	.4byte _0801C460 @ case 48
	.4byte _0801C460 @ case 49
	.4byte _0801C460 @ case 50
	.4byte _0801C460 @ case 51
	.4byte _0801C460 @ case 52
	.4byte _0801C460 @ case 53
	.4byte _0801C460 @ case 54
	.4byte _0801C460 @ case 55
	.4byte _0801C460 @ case 56
	.4byte _0801C460 @ case 57
	.4byte _0801C460 @ case 58
	.4byte _0801C460 @ case 59
	.4byte _0801C460 @ case 60
	.4byte _0801C480 @ case 61
	.4byte _0801C454 @ case 62
_0801C448:
	ldr r1, _0801C450 @ =0x03001778
	movs r0, #1
	b _0801C484
	.align 2, 0
_0801C450: .4byte 0x03001778
_0801C454:
	ldr r1, _0801C45C @ =0x03001778
	movs r0, #3
	b _0801C484
	.align 2, 0
_0801C45C: .4byte 0x03001778
_0801C460:
	ldr r0, _0801C478 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0801C480
	ldr r1, _0801C47C @ =0x03001778
	movs r0, #3
	b _0801C484
	.align 2, 0
_0801C478: .4byte 0x085775CC
_0801C47C: .4byte 0x03001778
_0801C480:
	ldr r1, _0801C4F0 @ =0x03001778
	movs r0, #2
_0801C484:
	strb r0, [r1]
	adds r0, r2, #0
	bl GetROMChapterStruct
	ldr r0, [r0]
	mov sl, r0
	ldr r0, _0801C4F0 @ =0x03001778
	ldrb r0, [r0]
	lsls r0, r0, #2
	add r0, sp
	ldr r0, [r0]
	mov sb, r0
	lsls r5, r4, #5
	adds r5, r5, r7
	lsls r5, r5, #1
	ldr r6, _0801C4F4 @ =0x02022CA8
	adds r5, r5, r6
	ldr r0, _0801C4F8 @ =0x080DC770
	mov r8, r0
	adds r0, r5, #0
	mov r1, r8
	bl sub_8003750
	adds r4, #1
	lsls r4, r4, #5
	adds r4, r4, r7
	lsls r4, r4, #1
	adds r4, r4, r6
	adds r0, r4, #0
	mov r1, r8
	bl sub_8003750
	adds r0, r5, #0
	mov r1, sl
	bl sub_8003750
	adds r0, r4, #0
	mov r1, sb
	bl sub_8003750
	movs r0, #1
	bl BG_EnableSyncByMask
	bl sub_8001EE4
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801C4F0: .4byte 0x03001778
_0801C4F4: .4byte 0x02022CA8
_0801C4F8: .4byte 0x080DC770

