	.syntax unified
	.section .text.GetGmPathBetweenNodes, "ax", %progbits
@ GetGmPathBetweenNodes @ JP 0x080C1BFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetGmPathBetweenNodes
	.thumb_func
GetGmPathBetweenNodes:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	movs r1, #0
	ldr r3, _080C1C1C @ =0x081F6340
_080C1C06:
	movs r0, #4
	ldrsb r0, [r3, r0]
	cmp r5, r0
	bne _080C1C20
	movs r0, #5
	ldrsb r0, [r3, r0]
	cmp r4, r0
	bne _080C1C20
	movs r0, #0
	b _080C1C32
	.align 2, 0
_080C1C1C: .4byte 0x081F6340
_080C1C20:
	movs r0, #5
	ldrsb r0, [r3, r0]
	cmp r5, r0
	bne _080C1C38
	movs r0, #4
	ldrsb r0, [r3, r0]
	cmp r4, r0
	bne _080C1C38
	movs r0, #1
_080C1C32:
	str r0, [r2]
	adds r0, r1, #0
	b _080C1C44
_080C1C38:
	adds r3, #0xc
	adds r1, #1
	cmp r1, #0x1f
	bls _080C1C06
	movs r0, #1
	rsbs r0, r0, #0
_080C1C44:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

