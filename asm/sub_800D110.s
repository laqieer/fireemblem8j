	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_800D668, 0x0800D668 + 1
	.set sub_800D6D8, 0x0800D6D8 + 1
	.set sub_801DA74, 0x0801DA74 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_800D110, "ax", %progbits
@ sub_800D110 @ JP 0x0800D110 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D110
	.thumb_func
sub_800D110:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_801DA74
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D120
	b _0800D21A
_0800D120:
	adds r0, r4, #0
	bl sub_800D668
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800D148
	ldr r0, _0800D144 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0800D148
	adds r0, r4, #0
	bl sub_800D6D8
	b _0800D21A
	.align 2, 0
_0800D144: .4byte 0x085775CC
_0800D148:
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	cmp r0, #0
	beq _0800D170
	cmp r0, #4
	beq _0800D170
	ldr r2, _0800D180 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
_0800D170:
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq _0800D184
	adds r0, r4, #0
	bl sub_80D65C0
	b _0800D21A
	.align 2, 0
_0800D180: .4byte 0x03003020
_0800D184:
	ldrh r1, [r4, #0x3c]
	movs r0, #2
	orrs r0, r1
	strh r0, [r4, #0x3c]
_0800D18C:
	ldr r1, _0800D1A0 @ =0x030004B0
	movs r0, #0
	str r0, [r1]
	ldr r0, [r4, #0x38]
	ldrh r0, [r0]
	lsrs r0, r0, #8
	cmp r0, #0x7f
	bhi _0800D1A8
	ldr r1, _0800D1A4 @ =0x085B9908
	b _0800D1AC
	.align 2, 0
_0800D1A0: .4byte 0x030004B0
_0800D1A4: .4byte 0x085B9908
_0800D1A8:
	ldr r1, _0800D1CC @ =0x085B9A7C
	subs r0, #0x80
_0800D1AC:
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r4, #0
	bl sub_80D65C0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #6
	bhi _0800D18C
	lsls r0, r0, #2
	ldr r1, _0800D1D0 @ =_0800D1D4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800D1CC: .4byte 0x085B9A7C
_0800D1D0: .4byte _0800D1D4
_0800D1D4: @ jump table
	.4byte _0800D1F0 @ case 0
	.4byte _0800D18C @ case 1
	.4byte _0800D202 @ case 2
	.4byte _0800D21A @ case 3
	.4byte _0800D18C @ case 4
	.4byte _0800D214 @ case 5
	.4byte _0800D18C @ case 6
_0800D1F0:
	ldr r0, [r4, #0x38]
	ldrh r1, [r0]
	lsrs r1, r1, #4
	movs r2, #0xf
	ands r1, r2
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r4, #0x38]
	b _0800D18C
_0800D202:
	ldr r0, [r4, #0x38]
	ldrh r1, [r0]
	lsrs r1, r1, #4
	movs r2, #0xf
	ands r1, r2
	lsls r1, r1, #1
	adds r0, r0, r1
	str r0, [r4, #0x38]
	b _0800D21A
_0800D214:
	adds r0, r4, #0
	bl sub_8002DE4
_0800D21A:
	pop {r4}
	pop {r0}
	bx r0

