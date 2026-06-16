	.syntax unified
	.set AiFindTargetInReachByFunc, 0x0803A99C + 1
	.set sub_803BA10, 0x0803BA10 + 1
	.section .text.sub_803D394, "ax", %progbits
@ sub_803D394 @ JP 0x0803D394 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803D394
	.thumb_func
sub_803D394:
	push {r4, lr}
	sub sp, #8
	ldr r0, _0803D3C8 @ =AiIsUnitNonActive
	add r4, sp, #4
	adds r1, r4, #0
	bl AiFindTargetInReachByFunc
	lsls r0, r0, #0x18
	asrs r2, r0, #0x18
	cmp r2, #1
	bne _0803D3BE
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r3, #2
	ldrsh r1, [r4, r3]
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl sub_803BA10
_0803D3BE:
	add sp, #8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0803D3C8: .4byte 0x0803C7D9  @ AiIsUnitNonActive

