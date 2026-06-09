	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80B14EC, "ax", %progbits
@ sub_80B14EC @ JP 0x080B14EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B14EC
	.thumb_func
sub_80B14EC:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r2, #0
	adds r7, r3, #0
	ldr r0, _080B1520 @ =0x08A9DAB4
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _080B151A
	lsls r0, r4, #2
	adds r1, r1, r0
	adds r0, r1, #0
	adds r0, #0x2c
	strb r5, [r0]
	adds r0, #1
	strb r6, [r0]
	adds r0, #1
	strb r7, [r0]
	adds r1, #0x2f
	ldr r0, [sp, #0x14]
	strb r0, [r1]
_080B151A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1520: .4byte 0x08A9DAB4

