	.syntax unified
	.section .text.ClearTalkFaceRefs, "ax", %progbits
@ ClearTalkFaceRefs @ JP 0x080066EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClearTalkFaceRefs
	.thumb_func
ClearTalkFaceRefs:
	push {r4, lr}
	movs r2, #0
	ldr r4, _0800670C @ =0x085B90D4
	movs r3, #0
_080066F4:
	ldr r0, [r4]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	str r3, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080066F4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0800670C: .4byte 0x085B90D4

