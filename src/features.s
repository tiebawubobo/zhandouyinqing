.text
.thumb
.thumb_func
.align 2


_hooke_at_0x806a518:@get
	push {r4,lr}
	cmp r1, #0x2e
	bne _return_get
	ldrh r3, [r0, #0x1e]
	lsl r3, #31
	lsr r3, #31
	cmp r3, #0
	beq _return_get
	mov r0,#4
	pop {r4,pc}

_return_get:
	mov r4,r0
	mov r3,r1
	mov r0,r3
	ldr r1, =(0x806a521)
	bx r1

_hook_at_0x806ACAC:@set
	push {lr}
	cmp r1,#0x2e
	bne _return_set
	ldrh r3, [r0, #0x1e]
	lsl r3, #1
	lsr r3, #1
	strh r3, [r0, #0x1e]
	ldrb r3,[r2,#0]
	cmp r3, #1
	bhi set_new_value
	b _return_set
set_new_value:
	ldrh r3, [r0, #0x1e]
	mov r2, #1
	orr r3, r2
	strh r3, [r0, #0x1e]
	pop {pc}
_return_set:
	mov r3,r0
	mov r0,r1
	sub r0,#0x37
	cmp r0,#0xA
	bhi offset_1
	ldr r1, =(0x806ad91)
	sub r1, #0xd8
r1_caller:
	bx r1
offset_1:
	ldr r0, =(0x806ad91)
	bx r0


set_new_ability_bit:@0x67bb4  0x20240a3
	ldr r1, =(rng)
	bl r1_caller
	mov r1, #0xf
	and r0, r1
	cmp r0, #4
	bhi to_return
	mov r0,r8
	mov r1,#1
	strh r1,[r0,#0x1e]
to_return:
	mov r8,r3
	pop {r4-r7,pc}