	.syntax unified
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_80D60E8, "ax", %progbits
@ sub_80D60E8 @ JP 0x080D60E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D60E8
	.thumb_func
sub_80D60E8:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, [r6, #0x40]
	ldrb r5, [r1]
	adds r2, r1, #1
	str r2, [r6, #0x40]
	ldr r0, [r4, #0x18]
	ldrb r1, [r1, #1]
	adds r3, r1, r0
	adds r0, r2, #1
	str r0, [r6, #0x40]
	ldrb r2, [r2, #1]
	adds r0, #1
	str r0, [r6, #0x40]
	cmp r5, #0x11
	bls _080D610C
	b _080D623A
_080D610C:
	lsls r0, r5, #2
	ldr r1, _080D6118 @ =_080D611C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D6118: .4byte _080D611C
_080D611C: @ jump table
	.4byte _080D6164 @ case 0
	.4byte _080D6168 @ case 1
	.4byte _080D6170 @ case 2
	.4byte _080D6178 @ case 3
	.4byte _080D6182 @ case 4
	.4byte _080D6190 @ case 5
	.4byte _080D619E @ case 6
	.4byte _080D61A6 @ case 7
	.4byte _080D61AE @ case 8
	.4byte _080D61B6 @ case 9
	.4byte _080D61BE @ case 10
	.4byte _080D61C6 @ case 11
	.4byte _080D61CE @ case 12
	.4byte _080D61DC @ case 13
	.4byte _080D61EA @ case 14
	.4byte _080D61F8 @ case 15
	.4byte _080D6206 @ case 16
	.4byte _080D6214 @ case 17
_080D6164:
	strb r2, [r3]
	b _080D623A
_080D6168:
	ldrb r1, [r3]
	adds r0, r1, r2
	strb r0, [r3]
	b _080D623A
_080D6170:
	ldrb r1, [r3]
	subs r0, r1, r2
	strb r0, [r3]
	b _080D623A
_080D6178:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r0, [r0]
	strb r0, [r3]
	b _080D623A
_080D6182:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	adds r0, r1, r0
	strb r0, [r3]
	b _080D623A
_080D6190:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r1, [r3]
	ldrb r0, [r0]
	subs r0, r1, r0
	strb r0, [r3]
	b _080D623A
_080D619E:
	ldrb r3, [r3]
	cmp r3, r2
	beq _080D6220
	b _080D6234
_080D61A6:
	ldrb r3, [r3]
	cmp r3, r2
	bne _080D6220
	b _080D6234
_080D61AE:
	ldrb r3, [r3]
	cmp r3, r2
	bhi _080D6220
	b _080D6234
_080D61B6:
	ldrb r3, [r3]
	cmp r3, r2
	bhs _080D6220
	b _080D6234
_080D61BE:
	ldrb r3, [r3]
	cmp r3, r2
	bls _080D6220
	b _080D6234
_080D61C6:
	ldrb r3, [r3]
	cmp r3, r2
	blo _080D6220
	b _080D6234
_080D61CE:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	beq _080D6220
	b _080D6234
_080D61DC:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bne _080D6220
	b _080D6234
_080D61EA:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhi _080D6220
	b _080D6234
_080D61F8:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _080D6220
	b _080D6234
_080D6206:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bls _080D6220
	b _080D6234
_080D6214:
	ldr r0, [r4, #0x18]
	adds r0, r0, r2
	ldrb r3, [r3]
	ldrb r0, [r0]
	cmp r3, r0
	bhs _080D6234
_080D6220:
	ldr r0, _080D6230 @ =0x03006474
	ldr r2, [r0]
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_80D65C4
	b _080D623A
	.align 2, 0
_080D6230: .4byte 0x03006474
_080D6234:
	ldr r0, [r6, #0x40]
	adds r0, #4
	str r0, [r6, #0x40]
_080D623A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

