	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8065124, "ax", %progbits
@ sub_8065124 @ JP 0x08065124 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8065124
	.thumb_func
sub_8065124:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_0806512A:
	ldr r0, _08065154 @ =0x08601448
	movs r1, #3
	bl sub_8002BCC
	str r5, [r0, #0x5c]
	str r4, [r0, #0x44]
	adds r4, #1
	cmp r4, #7
	bls _0806512A
	ldr r0, _08065158 @ =0x0875A9DC
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0806515C @ =0x0875A5DC
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08065154: .4byte 0x08601448
_08065158: .4byte 0x0875A9DC
_0806515C: .4byte 0x0875A5DC

