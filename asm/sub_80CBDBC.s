	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80CBDBC, "ax", %progbits
@ sub_80CBDBC @ JP 0x080CBDBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CBDBC
	.thumb_func
sub_80CBDBC:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r3, [r4, #0x2a]
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_8012E84
	ldr r2, _080CBDF4 @ =0x03003020
	adds r1, r2, #0
	adds r1, #0x44
	strb r0, [r1]
	movs r1, #0x10
	subs r1, r1, r0
	adds r2, #0x45
	strb r1, [r2]
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x10
	bne _080CBDF8
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CBDFC
	.align 2, 0
_080CBDF4: .4byte 0x03003020
_080CBDF8:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CBDFC:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

