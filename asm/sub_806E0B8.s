	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_806DFBC, 0x0806DFBC + 1
	.section .text.sub_806E0B8, "ax", %progbits
@ sub_806E0B8 @ JP 0x0806E0B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806E0B8
	.thumb_func
sub_806E0B8:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	movs r1, #0x1f
	ands r1, r0
	cmp r1, #0x1c
	bls _0806E0C8
	b _0806E1EA
_0806E0C8:
	lsls r0, r1, #2
	ldr r1, _0806E0D4 @ =_0806E0D8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806E0D4: .4byte _0806E0D8
_0806E0D8: @ jump table
	.4byte _0806E14C @ case 0
	.4byte _0806E1EA @ case 1
	.4byte _0806E1EA @ case 2
	.4byte _0806E1EA @ case 3
	.4byte _0806E160 @ case 4
	.4byte _0806E1EA @ case 5
	.4byte _0806E1EA @ case 6
	.4byte _0806E1EA @ case 7
	.4byte _0806E174 @ case 8
	.4byte _0806E1EA @ case 9
	.4byte _0806E1EA @ case 10
	.4byte _0806E1EA @ case 11
	.4byte _0806E188 @ case 12
	.4byte _0806E1EA @ case 13
	.4byte _0806E1EA @ case 14
	.4byte _0806E1EA @ case 15
	.4byte _0806E19C @ case 16
	.4byte _0806E1EA @ case 17
	.4byte _0806E1EA @ case 18
	.4byte _0806E1EA @ case 19
	.4byte _0806E1B0 @ case 20
	.4byte _0806E1EA @ case 21
	.4byte _0806E1EA @ case 22
	.4byte _0806E1EA @ case 23
	.4byte _0806E1C4 @ case 24
	.4byte _0806E1EA @ case 25
	.4byte _0806E1EA @ case 26
	.4byte _0806E1EA @ case 27
	.4byte _0806E1D8 @ case 28
_0806E14C:
	ldr r0, [r4, #0x5c]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r3, #0xc
	subs r3, r3, r1
	movs r1, #0
	movs r2, #0
	bl sub_806DFBC
	b _0806E1EA
_0806E160:
	ldr r0, [r4, #0x5c]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r3, #0xc
	subs r3, r3, r1
	movs r1, #1
	movs r2, #5
	bl sub_806DFBC
	b _0806E1EA
_0806E174:
	ldr r0, [r4, #0x5c]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r3, #0xc
	subs r3, r3, r1
	movs r1, #0
	movs r2, #6
	bl sub_806DFBC
	b _0806E1EA
_0806E188:
	ldr r0, [r4, #0x5c]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r3, #0xc
	subs r3, r3, r1
	movs r1, #1
	movs r2, #4
	bl sub_806DFBC
	b _0806E1EA
_0806E19C:
	ldr r0, [r4, #0x5c]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r3, #0xc
	subs r3, r3, r1
	movs r1, #0
	movs r2, #2
	bl sub_806DFBC
	b _0806E1EA
_0806E1B0:
	ldr r0, [r4, #0x5c]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r3, #0xc
	subs r3, r3, r1
	movs r1, #1
	movs r2, #1
	bl sub_806DFBC
	b _0806E1EA
_0806E1C4:
	ldr r0, [r4, #0x5c]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r3, #0xc
	subs r3, r3, r1
	movs r1, #0
	movs r2, #3
	bl sub_806DFBC
	b _0806E1EA
_0806E1D8:
	ldr r0, [r4, #0x5c]
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	movs r3, #0xc
	subs r3, r3, r1
	movs r1, #1
	movs r2, #7
	bl sub_806DFBC
_0806E1EA:
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0xc
	bne _0806E206
	ldr r1, _0806E20C @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0806E206:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0806E20C: .4byte 0x0201774C

