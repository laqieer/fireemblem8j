	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80CBA98, "ax", %progbits
@ sub_80CBA98 @ JP 0x080CBA98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CBA98
	.thumb_func
sub_80CBA98:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r5, r6, #0
	adds r5, #0x4c
	movs r0, #0
	ldrsh r3, [r5, r0]
	adds r4, r6, #0
	adds r4, #0x64
	movs r1, #0
	ldrsh r0, [r4, r1]
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
	bl sub_8012E84
	ldr r1, _080CBAE0 @ =0x03003020
	adds r1, #0x46
	strb r0, [r1]
	movs r2, #0
	ldrsh r1, [r5, r2]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r1, r0
	bne _080CBAD2
	adds r0, r6, #0
	bl sub_8002DE4
_080CBAD2:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CBAE0: .4byte 0x03003020

