	.syntax unified
	.set sub_80024C4, 0x080024C4 + 1
	.section .text.sub_80C8CBC, "ax", %progbits
@ sub_80C8CBC @ JP 0x080C8CBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8CBC
	.thumb_func
sub_80C8CBC:
	push {lr}
	adds r1, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080C8CD6
	ldr r0, [r1, #0x34]
	movs r1, #1
	movs r2, #0
	bl sub_80024C4
_080C8CD6:
	pop {r0}
	bx r0
	.align 2, 0

