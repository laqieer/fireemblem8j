	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.section .text.sub_8029150, "ax", %progbits
@ sub_8029150 @ JP 0x08029150 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8029150
	.thumb_func
sub_8029150:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r4, #0
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	cmp r0, #1
	beq _08029164
	cmp r0, #0xf
	bne _0802919A
_08029164:
	adds r0, r6, #0
	bl GetItemIndex
	cmp r0, #0x98
	beq _08029174
	cmp r0, #0x99
	beq _0802917C
	b _0802917E
_08029174:
	ldr r4, _08029178 @ =0x08902530
	b _0802917E
	.align 2, 0
_08029178: .4byte 0x08902530
_0802917C:
	ldr r4, _080291BC @ =0x08902532
_0802917E:
	cmp r4, #0
	beq _0802919A
	ldrb r1, [r4]
	cmp r1, #0
	beq _0802919A
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
_0802918C:
	cmp r0, r1
	bne _08029192
	b _0802938C
_08029192:
	adds r4, #1
	ldrb r1, [r4]
	cmp r1, #0
	bne _0802918C
_0802919A:
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, #9
	bgt _080291A4
	b _080293A8
_080291A4:
	adds r0, r6, #0
	bl GetItemIndex
	subs r0, #0x64
	cmp r0, #0x5d
	bls _080291B2
	b _08029392
_080291B2:
	lsls r0, r0, #2
	ldr r1, _080291C0 @ =_080291C4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080291BC: .4byte 0x08902532
_080291C0: .4byte _080291C4
_080291C4: @ jump table
	.4byte _0802933C @ case 0
	.4byte _08029344 @ case 1
	.4byte _0802934C @ case 2
	.4byte _08029354 @ case 3
	.4byte _0802935C @ case 4
	.4byte _08029392 @ case 5
	.4byte _08029392 @ case 6
	.4byte _08029392 @ case 7
	.4byte _08029392 @ case 8
	.4byte _08029392 @ case 9
	.4byte _08029392 @ case 10
	.4byte _08029392 @ case 11
	.4byte _08029392 @ case 12
	.4byte _08029392 @ case 13
	.4byte _08029392 @ case 14
	.4byte _08029392 @ case 15
	.4byte _08029392 @ case 16
	.4byte _08029392 @ case 17
	.4byte _08029392 @ case 18
	.4byte _08029392 @ case 19
	.4byte _08029392 @ case 20
	.4byte _08029392 @ case 21
	.4byte _08029392 @ case 22
	.4byte _08029392 @ case 23
	.4byte _08029392 @ case 24
	.4byte _08029392 @ case 25
	.4byte _08029392 @ case 26
	.4byte _08029392 @ case 27
	.4byte _08029392 @ case 28
	.4byte _08029392 @ case 29
	.4byte _08029392 @ case 30
	.4byte _08029392 @ case 31
	.4byte _08029392 @ case 32
	.4byte _08029392 @ case 33
	.4byte _08029392 @ case 34
	.4byte _08029392 @ case 35
	.4byte _08029364 @ case 36
	.4byte _08029392 @ case 37
	.4byte _0802937C @ case 38
	.4byte _08029392 @ case 39
	.4byte _08029392 @ case 40
	.4byte _08029392 @ case 41
	.4byte _08029392 @ case 42
	.4byte _08029392 @ case 43
	.4byte _08029392 @ case 44
	.4byte _08029392 @ case 45
	.4byte _08029392 @ case 46
	.4byte _08029392 @ case 47
	.4byte _08029392 @ case 48
	.4byte _08029392 @ case 49
	.4byte _08029392 @ case 50
	.4byte _08029390 @ case 51
	.4byte _0802936C @ case 52
	.4byte _08029374 @ case 53
	.4byte _08029392 @ case 54
	.4byte _08029392 @ case 55
	.4byte _08029392 @ case 56
	.4byte _08029392 @ case 57
	.4byte _08029392 @ case 58
	.4byte _08029392 @ case 59
	.4byte _08029392 @ case 60
	.4byte _08029392 @ case 61
	.4byte _08029392 @ case 62
	.4byte _08029392 @ case 63
	.4byte _08029392 @ case 64
	.4byte _08029392 @ case 65
	.4byte _08029392 @ case 66
	.4byte _08029392 @ case 67
	.4byte _08029392 @ case 68
	.4byte _08029392 @ case 69
	.4byte _08029392 @ case 70
	.4byte _08029392 @ case 71
	.4byte _08029392 @ case 72
	.4byte _08029392 @ case 73
	.4byte _08029392 @ case 74
	.4byte _08029392 @ case 75
	.4byte _08029392 @ case 76
	.4byte _08029392 @ case 77
	.4byte _08029392 @ case 78
	.4byte _08029392 @ case 79
	.4byte _08029392 @ case 80
	.4byte _08029392 @ case 81
	.4byte _08029392 @ case 82
	.4byte _08029392 @ case 83
	.4byte _08029392 @ case 84
	.4byte _08029392 @ case 85
	.4byte _08029392 @ case 86
	.4byte _08029392 @ case 87
	.4byte _08029392 @ case 88
	.4byte _08029392 @ case 89
	.4byte _08029392 @ case 90
	.4byte _08029392 @ case 91
	.4byte _08029392 @ case 92
	.4byte _08029384 @ case 93
_0802933C:
	ldr r4, _08029340 @ =0x089024E3
	b _08029392
	.align 2, 0
_08029340: .4byte 0x089024E3
_08029344:
	ldr r4, _08029348 @ =0x089024EA
	b _08029392
	.align 2, 0
_08029348: .4byte 0x089024EA
_0802934C:
	ldr r4, _08029350 @ =0x089024F0
	b _08029392
	.align 2, 0
_08029350: .4byte 0x089024F0
_08029354:
	ldr r4, _08029358 @ =0x089024F3
	b _08029392
	.align 2, 0
_08029358: .4byte 0x089024F3
_0802935C:
	ldr r4, _08029360 @ =0x089024F7
	b _08029392
	.align 2, 0
_08029360: .4byte 0x089024F7
_08029364:
	ldr r4, _08029368 @ =0x08902502
	b _08029392
	.align 2, 0
_08029368: .4byte 0x08902502
_0802936C:
	ldr r4, _08029370 @ =0x08902530
	b _08029392
	.align 2, 0
_08029370: .4byte 0x08902530
_08029374:
	ldr r4, _08029378 @ =0x08902532
	b _08029392
	.align 2, 0
_08029378: .4byte 0x08902532
_0802937C:
	ldr r4, _08029380 @ =0x08902522
	b _08029392
	.align 2, 0
_08029380: .4byte 0x08902522
_08029384:
	ldr r4, _08029388 @ =0x0890252F
	b _08029392
	.align 2, 0
_08029388: .4byte 0x0890252F
_0802938C:
	movs r0, #1
	b _080293AA
_08029390:
	ldr r4, _080293B0 @ =0x0890252A
_08029392:
	ldrb r1, [r4]
	cmp r1, #0
	beq _080293A8
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
_0802939C:
	cmp r0, r1
	beq _0802938C
	adds r4, #1
	ldrb r1, [r4]
	cmp r1, #0
	bne _0802939C
_080293A8:
	movs r0, #0
_080293AA:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080293B0: .4byte 0x0890252A

