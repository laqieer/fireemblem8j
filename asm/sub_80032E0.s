	.syntax unified
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.RunProcessScript, "ax", %progbits
@ RunProcessScript @ JP 0x080032E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global RunProcessScript
	.thumb_func
RunProcessScript:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	cmp r0, #0
	beq _08003322
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r0, [r0]
	cmp r0, #0
	bne _08003322
	ldr r0, [r4, #0xc]
	cmp r0, #0
	bne _08003322
	ldr r5, _08003300 @ =0x08577688
	b _0800330A
	.align 2, 0
_08003300: .4byte 0x08577688
_08003304:
	ldr r0, [r4]
	cmp r0, #0
	beq _08003322
_0800330A:
	ldr r0, [r4, #4]
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r1, [r0]
	adds r0, r4, #0
	bl sub_80D65C0
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08003304
_08003322:
	pop {r4, r5}
	pop {r0}
	bx r0

