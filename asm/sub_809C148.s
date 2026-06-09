	.syntax unified
	.set SetGMapBaseMenuPid, 0x080C8E54 + 1
	.section .text.sub_809C148, "ax", %progbits
@ sub_809C148 @ JP 0x0809C148 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C148
	.thumb_func
sub_809C148:
	push {lr}
	adds r2, r0, #0
	ldr r0, _0809C174 @ =0x03005270
	ldrb r1, [r0]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0809C16E
	adds r0, r2, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _0809C16E
	movs r0, #0
	bl SetGMapBaseMenuPid
_0809C16E:
	pop {r0}
	bx r0
	.align 2, 0
_0809C174: .4byte 0x03005270

