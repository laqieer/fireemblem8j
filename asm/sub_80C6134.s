	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80C6134, "ax", %progbits
@ sub_80C6134 @ JP 0x080C6134 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6134
	.thumb_func
sub_80C6134:
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	cmp r2, #0
	beq _080C6158
	ldr r0, _080C6150 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	ldr r0, _080C6154 @ =0x08AC23F8
	adds r1, r2, #0
	bl Proc_StartBlocking
	b _080C6180
	.align 2, 0
_080C6150: .4byte 0x03005270
_080C6154: .4byte 0x08AC23F8
_080C6158:
	ldr r0, _080C6170 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C6178
	ldr r0, _080C6174 @ =0x08AC23F8
	movs r1, #3
	bl sub_8002BCC
	b _080C6180
	.align 2, 0
_080C6170: .4byte 0x03005270
_080C6174: .4byte 0x08AC23F8
_080C6178:
	ldr r0, _080C618C @ =0x08AC23F8
	movs r1, #3
	bl Proc_StartBlocking
_080C6180:
	adds r1, r0, #0
	adds r1, #0x2a
	strb r4, [r1]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080C618C: .4byte 0x08AC23F8

