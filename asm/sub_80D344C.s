	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80D2EBC, 0x080D2EBC + 1
	.section .text.sub_80D344C, "ax", %progbits
@ sub_80D344C @ JP 0x080D344C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D344C
	.thumb_func
sub_80D344C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sb, r1
	movs r4, #0xd0
	lsls r4, r4, #1
	ldr r0, _080D3470 @ =0x08BABAF4
	ldr r0, [r0]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	beq _080D3474
	cmp r0, #1
	beq _080D34D8
	b _080D3536
	.align 2, 0
_080D3470: .4byte 0x08BABAF4
_080D3474:
	movs r0, #0
	ldr r7, _080D34D4 @ =0x020234A8
_080D3478:
	movs r1, #0x40
	rsbs r1, r1, #0
	adds r1, r1, r4
	mov ip, r1
	adds r6, r0, #1
	adds r3, r4, #0
	adds r3, #0x22
	adds r2, r4, #0
	adds r2, #0x62
	adds r1, r4, #2
	adds r0, r4, #0
	adds r0, #0x42
	movs r5, #7
	lsls r0, r0, #1
	adds r4, r0, r7
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r3, r3, #1
	adds r3, r3, r7
_080D34A2:
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r1, #2
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _080D34A2
	mov r4, ip
	adds r0, r6, #0
	cmp r0, #4
	ble _080D3478
	mov r0, sb
	movs r1, #6
	bl __modsi3
	adds r1, r0, #0
	mov r0, sb
	movs r2, #5
	bl sub_80D2EBC
	b _080D3536
	.align 2, 0
_080D34D4: .4byte 0x020234A8
_080D34D8:
	movs r0, #0
	ldr r1, _080D354C @ =0x08BABC3C
	mov sl, r1
	ldr r7, _080D3550 @ =0x020234A8
_080D34E0:
	movs r1, #0x40
	rsbs r1, r1, #0
	adds r1, r1, r4
	mov ip, r1
	adds r6, r0, #1
	adds r3, r4, #0
	adds r3, #0x2a
	adds r2, r4, #0
	adds r2, #0x6a
	adds r1, r4, #0
	adds r1, #0xa
	adds r0, r4, #0
	adds r0, #0x4a
	movs r5, #0x12
	lsls r0, r0, #1
	adds r4, r0, r7
	lsls r1, r1, #1
	adds r1, r1, r7
	lsls r2, r2, #1
	adds r2, r2, r7
	lsls r3, r3, #1
	adds r3, r3, r7
_080D350C:
	ldrh r0, [r1]
	strh r0, [r4]
	ldrh r0, [r3]
	strh r0, [r2]
	adds r3, #2
	adds r2, #2
	adds r1, #2
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bge _080D350C
	mov r4, ip
	adds r0, r6, #0
	cmp r0, #4
	ble _080D34E0
	mov r0, sl
	mov r1, r8
	bl sub_8002BCC
	mov r1, sb
	str r1, [r0, #0x34]
_080D3536:
	movs r0, #2
	bl BG_EnableSyncByMask
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D354C: .4byte 0x08BABC3C
_080D3550: .4byte 0x020234A8

