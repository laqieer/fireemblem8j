	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.set sub_8074888, 0x08074888 + 1
	.section .text.sub_806F678, "ax", %progbits
@ sub_806F678 @ JP 0x0806F678 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806F678
	.thumb_func
sub_806F678:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r4, r1, #0
	ldr r1, _0806F6E0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806F6E4 @ =0x08603684
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r6, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	ldr r2, _0806F6E8 @ =0x0861E2E8
	cmp r4, #0
	beq _0806F6A6
	ldr r2, _0806F6EC @ =0x0861E578
	cmp r4, #1
	bne _0806F6A6
	ldr r2, _0806F6F0 @ =0x0861E430
_0806F6A6:
	ldr r3, _0806F6F4 @ =0x0861E38C
	cmp r4, #0
	beq _0806F6B4
	ldr r3, _0806F6F8 @ =0x0861E61C
	cmp r4, #1
	bne _0806F6B4
	ldr r3, _0806F6FC @ =0x0861E4D4
_0806F6B4:
	str r2, [sp]
	adds r0, r6, #0
	adds r1, r3, #0
	bl sub_80564F0
	str r0, [r5, #0x60]
	ldr r4, _0806F700 @ =0x0203E1C8
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0x40
	bls _0806F6D6
	b _0806F840
_0806F6D6:
	lsls r0, r0, #2
	ldr r1, _0806F704 @ =_0806F708
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806F6E0: .4byte 0x0201774C
_0806F6E4: .4byte 0x08603684
_0806F6E8: .4byte 0x0861E2E8
_0806F6EC: .4byte 0x0861E578
_0806F6F0: .4byte 0x0861E430
_0806F6F4: .4byte 0x0861E38C
_0806F6F8: .4byte 0x0861E61C
_0806F6FC: .4byte 0x0861E4D4
_0806F700: .4byte 0x0203E1C8
_0806F704: .4byte _0806F708
_0806F708: @ jump table
	.4byte _0806F840 @ case 0
	.4byte _0806F80C @ case 1
	.4byte _0806F80C @ case 2
	.4byte _0806F80C @ case 3
	.4byte _0806F80C @ case 4
	.4byte _0806F80C @ case 5
	.4byte _0806F838 @ case 6
	.4byte _0806F838 @ case 7
	.4byte _0806F838 @ case 8
	.4byte _0806F838 @ case 9
	.4byte _0806F80C @ case 10
	.4byte _0806F838 @ case 11
	.4byte _0806F80C @ case 12
	.4byte _0806F80C @ case 13
	.4byte _0806F80C @ case 14
	.4byte _0806F80C @ case 15
	.4byte _0806F828 @ case 16
	.4byte _0806F80C @ case 17
	.4byte _0806F80C @ case 18
	.4byte _0806F80C @ case 19
	.4byte _0806F814 @ case 20
	.4byte _0806F828 @ case 21
	.4byte _0806F828 @ case 22
	.4byte _0806F838 @ case 23
	.4byte _0806F838 @ case 24
	.4byte _0806F80C @ case 25
	.4byte _0806F80C @ case 26
	.4byte _0806F80C @ case 27
	.4byte _0806F80C @ case 28
	.4byte _0806F838 @ case 29
	.4byte _0806F838 @ case 30
	.4byte _0806F838 @ case 31
	.4byte _0806F838 @ case 32
	.4byte _0806F838 @ case 33
	.4byte _0806F80C @ case 34
	.4byte _0806F80C @ case 35
	.4byte _0806F838 @ case 36
	.4byte _0806F80C @ case 37
	.4byte _0806F80C @ case 38
	.4byte _0806F80C @ case 39
	.4byte _0806F80C @ case 40
	.4byte _0806F80C @ case 41
	.4byte _0806F80C @ case 42
	.4byte _0806F80C @ case 43
	.4byte _0806F840 @ case 44
	.4byte _0806F838 @ case 45
	.4byte _0806F840 @ case 46
	.4byte _0806F80C @ case 47
	.4byte _0806F838 @ case 48
	.4byte _0806F838 @ case 49
	.4byte _0806F838 @ case 50
	.4byte _0806F80C @ case 51
	.4byte _0806F840 @ case 52
	.4byte _0806F840 @ case 53
	.4byte _0806F828 @ case 54
	.4byte _0806F838 @ case 55
	.4byte _0806F80C @ case 56
	.4byte _0806F80C @ case 57
	.4byte _0806F80C @ case 58
	.4byte _0806F80C @ case 59
	.4byte _0806F828 @ case 60
	.4byte _0806F80C @ case 61
	.4byte _0806F838 @ case 62
	.4byte _0806F80C @ case 63
	.4byte _0806F80C @ case 64
_0806F80C:
	ldr r0, _0806F810 @ =0x0861E1F8
	b _0806F82A
	.align 2, 0
_0806F810: .4byte 0x0861E1F8
_0806F814:
	ldr r0, [r5, #0x5c]
	bl sub_8074888
	cmp r0, #0
	beq _0806F828
	ldr r0, _0806F824 @ =0x0861E1F8
	b _0806F82A
	.align 2, 0
_0806F824: .4byte 0x0861E1F8
_0806F828:
	ldr r0, _0806F834 @ =0x0861E218
_0806F82A:
	movs r1, #0x20
	bl sub_805679C
	b _0806F840
	.align 2, 0
_0806F834: .4byte 0x0861E218
_0806F838:
	ldr r0, _0806F854 @ =0x0861E238
	movs r1, #0x20
	bl sub_805679C
_0806F840:
	ldr r0, _0806F858 @ =0x0861DD88
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806F854: .4byte 0x0861E238
_0806F858: .4byte 0x0861DD88

