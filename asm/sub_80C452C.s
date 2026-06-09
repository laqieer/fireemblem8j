	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80C452C, "ax", %progbits
@ sub_80C452C @ JP 0x080C452C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C452C
	.thumb_func
sub_80C452C:
	push {r4, lr}
	ldr r4, _080C4564 @ =0x08AC1F1C
	adds r0, r4, #0
	bl Proc_Find
	adds r3, r0, #0
	cmp r3, #0
	beq _080C455E
	ldr r0, [r3, #0x3c]
	adds r1, r3, #0
	adds r1, #0x35
	ldrb r1, [r1]
	lsls r1, r1, #1
	ldr r2, _080C4568 @ =0x020228A8
	adds r1, r1, r2
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r2, [r2]
	bl sub_80D6370
	bl sub_8001EE4
	adds r0, r4, #0
	bl Proc_EndEach
_080C455E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C4564: .4byte 0x08AC1F1C
_080C4568: .4byte 0x020228A8

