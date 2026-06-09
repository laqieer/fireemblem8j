	.syntax unified
	.set sub_800223C, 0x0800223C + 1
	.set sub_8002570, 0x08002570 + 1
	.section .text.sub_8073F38, "ax", %progbits
@ sub_8073F38 @ JP 0x08073F38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8073F38
	.thumb_func
sub_8073F38:
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	ldr r0, _08073F5C @ =0x0202BCAC
	ldrb r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	bne _08073F56
	adds r0, r2, #0
	bl sub_800223C
	adds r0, r4, #0
	bl sub_8002570
_08073F56:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08073F5C: .4byte 0x0202BCAC

