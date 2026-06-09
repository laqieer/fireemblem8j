	.syntax unified
	.section .text.sub_80B8C9C, "ax", %progbits
@ sub_80B8C9C @ JP 0x080B8C9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8C9C
	.thumb_func
sub_80B8C9C:
	push {lr}
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	adds r2, r1, #0
	adds r0, r1, #0
	subs r0, #0x61
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bhi _080B8CBC
	lsls r0, r1, #3
	ldr r1, _080B8CB8 @ =0x08AB0C04
	b _080B8CD0
	.align 2, 0
_080B8CB8: .4byte 0x08AB0C04
_080B8CBC:
	adds r0, r1, #0
	subs r0, #0x41
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x19
	bls _080B8CCC
	movs r0, #0
	b _080B8CD2
_080B8CCC:
	lsls r0, r2, #3
	ldr r1, _080B8CD8 @ =0x08AB0C34
_080B8CD0:
	adds r0, r0, r1
_080B8CD2:
	pop {r1}
	bx r1
	.align 2, 0
_080B8CD8: .4byte 0x08AB0C34

