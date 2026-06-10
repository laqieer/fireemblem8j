	.syntax unified
	.set sub_802A490, 0x0802A490 + 1
	.section .text.sub_802B2FC, "ax", %progbits
@ sub_802B2FC @ JP 0x0802B2FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802B2FC
	.thumb_func
sub_802B2FC:
	push {lr}
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x66
	beq _0802B318
	ldr r0, _0802B31C @ =0x0203A4D0
	ldrh r0, [r0, #0xe]
	movs r1, #0
	bl sub_802A490
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0802B320
_0802B318:
	movs r0, #0
	b _0802B322
	.align 2, 0
_0802B31C: .4byte 0x0203A4D0
_0802B320:
	movs r0, #1
_0802B322:
	pop {r1}
	bx r1
	.align 2, 0

