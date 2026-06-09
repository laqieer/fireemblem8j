	.syntax unified
	.set PutText, 0x08003DA0 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80890BC, "ax", %progbits
@ sub_80890BC @ JP 0x080890BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80890BC
	.thumb_func
sub_80890BC:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	b _080890F0
_080890C4:
	ldr r0, [r6, #0xc]
	cmp r0, #0
	beq _080890E6
	ldr r0, [r0]
	bl sub_8009FA8
	ldr r5, [r6]
	ldr r1, [r6, #4]
	ldrb r2, [r6, #8]
	ldrb r3, [r6, #9]
	movs r4, #0
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	bl sub_8004374
	b _080890EE
_080890E6:
	ldr r0, [r6]
	ldr r1, [r6, #4]
	bl PutText
_080890EE:
	adds r6, #0x10
_080890F0:
	ldr r0, [r6]
	cmp r0, #0
	bne _080890C4
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

