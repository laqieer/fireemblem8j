	.syntax unified
	.set WMLoc_GetChapterId, 0x080C03E0 + 1
	.section .text.sub_80C1E74, "ax", %progbits
@ sub_80C1E74 @ JP 0x080C1E74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C1E74
	.thumb_func
sub_80C1E74:
	push {r4, r5, r6, lr}
	ldr r0, _080C1E8C @ =0x0202BCEC
	movs r5, #0xe
	ldrsb r5, [r0, r5]
	cmp r5, #0x47
	bls _080C1E82
	b _080C1FB4
_080C1E82:
	lsls r0, r5, #2
	ldr r1, _080C1E90 @ =_080C1E94
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080C1E8C: .4byte 0x0202BCEC
_080C1E90: .4byte _080C1E94
_080C1E94: @ jump table
	.4byte _080C1FF0 @ case 0
	.4byte _080C1FF0 @ case 1
	.4byte _080C1FB4 @ case 2
	.4byte _080C1FB4 @ case 3
	.4byte _080C1FB4 @ case 4
	.4byte _080C1FF0 @ case 5
	.4byte _080C1FB4 @ case 6
	.4byte _080C1FB4 @ case 7
	.4byte _080C1FB4 @ case 8
	.4byte _080C1FB4 @ case 9
	.4byte _080C1FB4 @ case 10
	.4byte _080C1FB4 @ case 11
	.4byte _080C1FF0 @ case 12
	.4byte _080C1FB4 @ case 13
	.4byte _080C1FB4 @ case 14
	.4byte _080C1FB4 @ case 15
	.4byte _080C1FB4 @ case 16
	.4byte _080C1FB4 @ case 17
	.4byte _080C1FB4 @ case 18
	.4byte _080C1FB4 @ case 19
	.4byte _080C1FB4 @ case 20
	.4byte _080C1FF0 @ case 21
	.4byte _080C1FF0 @ case 22
	.4byte _080C1FB4 @ case 23
	.4byte _080C1FB4 @ case 24
	.4byte _080C1FF0 @ case 25
	.4byte _080C1FB4 @ case 26
	.4byte _080C1FB4 @ case 27
	.4byte _080C1FB4 @ case 28
	.4byte _080C1FB4 @ case 29
	.4byte _080C1FB4 @ case 30
	.4byte _080C1FB4 @ case 31
	.4byte _080C1FB4 @ case 32
	.4byte _080C1FB4 @ case 33
	.4byte _080C1FF0 @ case 34
	.4byte _080C1FF0 @ case 35
	.4byte _080C1FB4 @ case 36
	.4byte _080C1FB4 @ case 37
	.4byte _080C1FB4 @ case 38
	.4byte _080C1FB4 @ case 39
	.4byte _080C1FB4 @ case 40
	.4byte _080C1FB4 @ case 41
	.4byte _080C1FB4 @ case 42
	.4byte _080C1FB4 @ case 43
	.4byte _080C1FB4 @ case 44
	.4byte _080C1FB4 @ case 45
	.4byte _080C1FB4 @ case 46
	.4byte _080C1FB4 @ case 47
	.4byte _080C1FB4 @ case 48
	.4byte _080C1FB4 @ case 49
	.4byte _080C1FB4 @ case 50
	.4byte _080C1FB4 @ case 51
	.4byte _080C1FB4 @ case 52
	.4byte _080C1FB4 @ case 53
	.4byte _080C1FB4 @ case 54
	.4byte _080C1FB4 @ case 55
	.4byte _080C1FF0 @ case 56
	.4byte _080C1FB4 @ case 57
	.4byte _080C1FB4 @ case 58
	.4byte _080C1FF0 @ case 59
	.4byte _080C1FF0 @ case 60
	.4byte _080C1FB4 @ case 61
	.4byte _080C1FB4 @ case 62
	.4byte _080C1FF0 @ case 63
	.4byte _080C1FF0 @ case 64
	.4byte _080C1FF0 @ case 65
	.4byte _080C1FF0 @ case 66
	.4byte _080C1FF0 @ case 67
	.4byte _080C1FF0 @ case 68
	.4byte _080C1FF0 @ case 69
	.4byte _080C1FF0 @ case 70
	.4byte _080C1FF0 @ case 71
_080C1FB4:
	adds r0, r5, #0
	subs r0, #0x25
	cmp r0, #8
	bhi _080C1FC0
	movs r5, #0x24
	b _080C1FCA
_080C1FC0:
	adds r0, r5, #0
	subs r0, #0x2f
	cmp r0, #8
	bhi _080C1FCA
	movs r5, #0x2e
_080C1FCA:
	movs r4, #0
	ldr r6, _080C1FF4 @ =0x081F5D7C
_080C1FCE:
	adds r0, r4, #0
	bl WMLoc_GetChapterId
	cmp r5, r0
	bne _080C2006
	ldr r1, _080C1FF8 @ =0x03005270
	lsls r0, r4, #2
	adds r0, r0, r1
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C1FFC
	ldrb r0, [r6]
	cmp r0, #3
	beq _080C2002
_080C1FF0:
	movs r0, #0
	b _080C2010
	.align 2, 0
_080C1FF4: .4byte 0x081F5D7C
_080C1FF8: .4byte 0x03005270
_080C1FFC:
	ldrb r0, [r6, #1]
	cmp r0, #3
	bne _080C200E
_080C2002:
	movs r0, #1
	b _080C2010
_080C2006:
	adds r6, #0x20
	adds r4, #1
	cmp r4, #0x1c
	ble _080C1FCE
_080C200E:
	movs r0, #2
_080C2010:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

