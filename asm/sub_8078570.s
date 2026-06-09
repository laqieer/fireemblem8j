	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8077F9C, 0x08077F9C + 1
	.set sub_80780DC, 0x080780DC + 1
	.section .text.sub_8078570, "ax", %progbits
@ sub_8078570 @ JP 0x08078570 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8078570
	.thumb_func
sub_8078570:
	push {r4, lr}
	adds r4, r0, #0
	ldr r2, [r4, #0x48]
	cmp r2, #0
	beq _0807858C
	movs r1, #1
	bl sub_80780DC
	bl sub_8077F9C
	movs r0, #0
	strh r0, [r4, #0x2c]
	movs r0, #0x6c
	strh r0, [r4, #0x2e]
_0807858C:
	adds r0, r4, #0
	bl sub_8002DE4
	pop {r4}
	pop {r0}
	bx r0

