	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_805C170, "ax", %progbits
@ sub_805C170 @ JP 0x0805C170 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C170
	.thumb_func
sub_805C170:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0805C198 @ =0x0203E114
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r1, _0805C19C @ =0x085FF090
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r0, r5, #0
	bl sub_80D65C0
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805C198: .4byte 0x0203E114
_0805C19C: .4byte 0x085FF090

