	.syntax unified
	.section .text.GetFreeUnit, "ax", %progbits
@ GetFreeUnit @ JP 0x080175E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetFreeUnit
	.thumb_func
GetFreeUnit:
	push {r4, r5, lr}
	adds r3, r0, #0
	adds r3, #0x40
	adds r2, r0, #1
	cmp r2, r3
	bge _0801760E
	ldr r5, _08017604 @ =0x085C2A50
	movs r4, #0xff
_080175F0:
	adds r0, r2, #0
	ands r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	ldr r0, [r1]
	cmp r0, #0
	bne _08017608
	adds r0, r1, #0
	b _08017610
	.align 2, 0
_08017604: .4byte 0x085C2A50
_08017608:
	adds r2, #1
	cmp r2, r3
	blt _080175F0
_0801760E:
	movs r0, #0
_08017610:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

