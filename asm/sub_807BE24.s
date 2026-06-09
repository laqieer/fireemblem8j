	.syntax unified
	.set SetMuScreenOffset, 0x0807BC08 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_807BE24, "ax", %progbits
@ sub_807BE24 @ JP 0x0807BE24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BE24
	.thumb_func
sub_807BE24:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldr r2, [r5, #0x2c]
	movs r1, #1
	ands r0, r1
	subs r1, #3
	cmp r0, #0
	beq _0807BE40
	movs r1, #2
_0807BE40:
	adds r0, r2, #0
	movs r2, #0
	bl SetMuScreenOffset
	ldrb r0, [r4]
	cmp r0, #0xb
	bls _0807BE5E
	ldr r0, [r5, #0x2c]
	movs r1, #0
	movs r2, #0
	bl SetMuScreenOffset
	adds r0, r5, #0
	bl sub_8002DE4
_0807BE5E:
	pop {r4, r5}
	pop {r0}
	bx r0

