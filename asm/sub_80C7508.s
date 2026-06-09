	.syntax unified
	.set CountProcs, 0x08003448 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_80C7508, "ax", %progbits
@ sub_80C7508 @ JP 0x080C7508 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7508
	.thumb_func
sub_80C7508:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	strh r4, [r5, #0x30]
	ldr r0, _080C7558 @ =0x08AC2608
	bl CountProcs
	cmp r0, #1
	bgt _080C7550
	ldr r0, _080C755C @ =0x08B23F00
	movs r1, #0xc8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
_080C7550:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C7558: .4byte 0x08AC2608
_080C755C: .4byte 0x08B23F00

