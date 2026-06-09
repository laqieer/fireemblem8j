	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_801C7D8, 0x0801C7D8 + 1
	.set sub_8032D40, 0x08032D40 + 1
	.section .text.sub_801C884, "ax", %progbits
@ sub_801C884 @ JP 0x0801C884 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C884
	.thumb_func
sub_801C884:
	push {r4, r5, lr}
	ldr r5, _0801C8CC @ =0x0202BCAC
	ldrb r1, [r5, #4]
	movs r0, #2
	orrs r0, r1
	strb r0, [r5, #4]
	ldr r4, _0801C8D0 @ =0x03004DF0
	ldr r0, [r4]
	bl sub_801C7D8
	ldr r4, [r4]
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	movs r2, #0x14
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0801C8D8
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0x16
	ldrsh r0, [r5, r2]
	cmp r1, r0
	bne _0801C8D8
	movs r0, #0
	bl sub_8032D40
	ldr r0, _0801C8D4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0801C8DE
	movs r0, #0x69
	bl m4aSongNumStart
	b _0801C8DE
	.align 2, 0
_0801C8CC: .4byte 0x0202BCAC
_0801C8D0: .4byte 0x03004DF0
_0801C8D4: .4byte 0x0202BCEC
_0801C8D8:
	movs r0, #1
	bl sub_8032D40
_0801C8DE:
	pop {r4, r5}
	pop {r0}
	bx r0

