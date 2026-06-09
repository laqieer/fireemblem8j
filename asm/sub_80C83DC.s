	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80C8348, 0x080C8348 + 1
	.section .text.sub_80C83DC, "ax", %progbits
@ sub_80C83DC @ JP 0x080C83DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C83DC
	.thumb_func
sub_80C83DC:
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	ldr r0, _080C8410 @ =0x08AC2808
	bl Proc_Find
	adds r4, r0, #0
	cmp r4, #0
	beq _080C840A
	bl sub_80C8348
	ldr r2, _080C8414 @ =0x0201BE30
	ldrb r1, [r2]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x2a
	movs r0, #1
	strb r0, [r1]
_080C840A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C8410: .4byte 0x08AC2808
_080C8414: .4byte 0x0201BE30

