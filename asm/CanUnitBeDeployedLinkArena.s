	.syntax unified
	.section .text.CanUnitBeDeployedLinkArena, "ax", %progbits
@ CanUnitBeDeployedLinkArena @ JP 0x0809A14C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CanUnitBeDeployedLinkArena
	.thumb_func
CanUnitBeDeployedLinkArena:
	push {r4, lr}
	movs r2, #0
	ldr r0, [r0]
	ldrb r3, [r0, #4]
	ldr r1, _0809A164 @ =0x081F55D4
_0809A156:
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r3, r0
	bne _0809A168
	movs r0, #0
	b _0809A172
	.align 2, 0
_0809A164: .4byte 0x081F55D4
_0809A168:
	adds r1, #2
	adds r2, #1
	cmp r2, #0xa
	bls _0809A156
	movs r0, #1
_0809A172:
	pop {r4}
	pop {r1}
	bx r1

