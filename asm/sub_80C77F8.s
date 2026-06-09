	.syntax unified
	.set Proc_FindBegin, 0x0800347C + 1
	.set Proc_FindNext, 0x0800348C + 1
	.section .text.sub_80C77F8, "ax", %progbits
@ sub_80C77F8 @ JP 0x080C77F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C77F8
	.thumb_func
sub_80C77F8:
	push {r4, r5, lr}
	sub sp, #0x18
	movs r4, #0
	ldr r1, _080C7820 @ =0x08AC2608
	mov r0, sp
	bl Proc_FindBegin
	add r5, sp, #0xc
_080C7808:
	mov r0, sp
	bl Proc_FindNext
	cmp r0, #0
	beq _080C7824
	adds r0, #0x2b
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	stm r5!, {r0}
	adds r4, #1
	b _080C7808
	.align 2, 0
_080C7820: .4byte 0x08AC2608
_080C7824:
	cmp r4, #0
	bne _080C7830
	movs r0, #0
	b _080C785C
_080C782C:
	adds r0, r3, #0
	b _080C785C
_080C7830:
	movs r3, #0
	ldr r5, [sp, #0xc]
_080C7834:
	movs r2, #0
	cmp r2, r4
	bge _080C784E
	cmp r3, r5
	beq _080C784E
	add r1, sp, #0xc
_080C7840:
	adds r1, #4
	adds r2, #1
	cmp r2, r4
	bge _080C784E
	ldr r0, [r1]
	cmp r3, r0
	bne _080C7840
_080C784E:
	cmp r2, r4
	beq _080C782C
	adds r3, #1
	cmp r3, #2
	ble _080C7834
	movs r0, #1
	rsbs r0, r0, #0
_080C785C:
	add sp, #0x18
	pop {r4, r5}
	pop {r1}
	bx r1

