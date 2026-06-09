	.syntax unified
	.set AllocWeatherParticles, 0x08030144 + 1
	.set sub_800BFC8, 0x0800BFC8 + 1
	.set sub_800F364, 0x0800F364 + 1
	.set sub_80195E4, 0x080195E4 + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8026F38, 0x08026F38 + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_800F068, "ax", %progbits
@ sub_800F068 @ JP 0x0800F068 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800F068
	.thumb_func
sub_800F068:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #5
	bhi _0800F0D2
	lsls r0, r0, #2
	ldr r1, _0800F080 @ =_0800F084
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800F080: .4byte _0800F084
_0800F084: @ jump table
	.4byte _0800F09C @ case 0
	.4byte _0800F0D0 @ case 1
	.4byte _0800F0D0 @ case 2
	.4byte _0800F09C @ case 3
	.4byte _0800F09C @ case 4
	.4byte _0800F09C @ case 5
_0800F09C:
	ldr r4, _0800F0CC @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl sub_80195E4
	ldrb r0, [r4, #0x15]
	bl AllocWeatherParticles
	bl sub_8019914
	bl sub_8027144
	ldr r0, [r5, #0x34]
	adds r0, #0x44
	ldrh r0, [r0]
	bl sub_800BFC8
	bl sub_8026F38
	ldr r0, [r5, #0x34]
	bl sub_800F364
	b _0800F0D2
	.align 2, 0
_0800F0CC: .4byte 0x0202BCEC
_0800F0D0:
	b _0800F0D0
_0800F0D2:
	ldr r2, _0800F0F8 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0800F0F8: .4byte 0x03003020

